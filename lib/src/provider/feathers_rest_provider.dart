import 'package:dio/dio.dart';
import 'package:feathers_core/feathers_core.dart';
import 'package:feathers_rest/src/service/feathers_rest_service.dart';

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
