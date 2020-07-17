import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_feathers/flutter_feathers.dart';

import '../../flutter_feathers_rest.dart';

class FeathersRestService extends FeathersService {
  FeathersRestService(String serviceName, FeathersProvider provider)
      : super(serviceName, provider);

  // -- Utility Methods for easier access
  FeathersRestProvider getProvider() =>
      this.feathersProvider as FeathersRestProvider;

  Dio getDio() => getProvider().dio;

  //Implementation of FeathersService
  @override
  Future<dynamic> create(object) async {
    return (await getDio().post('/$serviceName', data: object)).data;
  }

  @override
  Future<List> find({Map<String, String> query = const {}}) async {
    return (await getDio().get('/$serviceName', queryParameters: query)).data;
  }

  @override
  Future<dynamic> get(String id) async {
    return (await getDio().get('/$serviceName/$id')).data;
  }

  @override
  Stream<dynamic> on(String eventName) async* {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> once(String eventName) async {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> patch(String id, object) async {
    return (await getDio().patch('/$serviceName/$id', data: object)).data;
  }

  @override
  Future<dynamic> update(String id, object) async {
    return (await getDio().put('/$serviceName/$id', data: object)).data;
  }

  @override
  Future<dynamic> remove(String id) async {
    return (await getDio().delete('/$serviceName/$id')).data;
  }
}
