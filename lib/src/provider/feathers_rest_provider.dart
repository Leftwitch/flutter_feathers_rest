import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_feathers/flutter_feathers.dart';

import '../../flutter_feathers_rest.dart';

class FeathersRestProvider extends FeathersProvider {
  String feathersRestEndpoint;
  Dio dio;

  FeathersRestProvider(this.feathersRestEndpoint);

  @override
  void initialize(Feathers app) {
    super.initialize(app);
    // or new Dio with a BaseOptions instance.
    BaseOptions options = new BaseOptions(
      baseUrl: this.feathersRestEndpoint,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = new Dio(options);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (Options options) async {
          if (currentAuthentication != null) {
            var accessToken = currentAuthentication['accessToken'];
            print('Using Access-Token: $accessToken');
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          return options;
        },
      ),
    );
  }

  @override
  FeathersService service(String name) {
    return FeathersRestService(name, this);
  }

  @override
  Future<dynamic> authenticate(Map<String, dynamic> data) async {
    var result = await service(authServiceName).create(data);
    currentAuthentication = result;
    return currentAuthentication;
  }

  @override
  Future<void> logout() async {
    currentAuthentication = {};
  }

  @override
  Future<dynamic> reAuthenticate() async {
    var storedAuth = jsonDecode((await readAccessTokenMethod()) ?? '{}');
    var storedToken = storedAuth['accessToken'];
    var result = await service(authServiceName)
        .create({'accessToken': storedToken, 'strategy': 'jwt'});

    currentAuthentication = result;
    return currentAuthentication;
  }
}
