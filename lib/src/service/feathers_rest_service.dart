import 'package:dio/dio.dart';
import 'package:feathers_core/feathers_core.dart';
import 'package:feathers_rest/src/provider/feathers_rest_provider.dart';

class FeathersRestService extends FeathersService {
  FeathersRestService(String serviceName, FeathersProvider provider)
      : super(serviceName, provider);

  // -- Utility Methods for easier access
  FeathersRestProvider getProvider() =>
      this.feathersProvider as FeathersRestProvider;

  Dio getDio() => getProvider().dio;

  String getRequestUrl() =>
      '${getProvider().feathersRestEndpoint}/$serviceName';

  //Implementation of FeathersService
  @override
  Future<void> create(object) async {
    await getDio().post(getRequestUrl(), data: object);
  }

  @override
  Future<List> find({Map<String, String> query = const {}}) async {
    var response =
        await getDio().get('${getRequestUrl()}', queryParameters: query);
    return response.data;
  }

  @override
  Future get(String id) async {
    var response = await getDio().get('${getRequestUrl()}/$id');
    return response.data;
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
  Future<void> patch(String id, object) async {
    await getDio().patch('${getRequestUrl()}/$id', data: object);
  }

  @override
  Future<void> update(String id, object) async {
    await getDio().put('${getRequestUrl()}/$id', data: object);
  }

  @override
  Future<void> remove(String id) async {
    await getDio().delete('${getRequestUrl()}/$id');
  }
}
