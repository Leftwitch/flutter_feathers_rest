import 'package:dio/dio.dart';
import 'package:feathers_rest/src/service/feathers_rest_service.dart';
import 'package:flutter_feathers/flutter_feathers.dart';

class FeathersRestProvider extends FeathersProvider {
  String feathersRestEndpoint;
  Dio dio;

  FeathersRestProvider(this.feathersRestEndpoint);

  @override
  void initialize(Feathers app) {
    super.initialize(app);

    dio = new Dio();
  }

  @override
  FeathersService service(String name) {
    return FeathersRestService(name, this);
  }
}
