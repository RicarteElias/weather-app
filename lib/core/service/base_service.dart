import 'package:get_it/get_it.dart';
import 'package:weather_app/core/service/http.dart';

class BaseService {
  final Http http = GetIt.instance.get<Http>();
}
