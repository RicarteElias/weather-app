import 'package:get_it/get_it.dart';
import 'package:weather_app/core/service/http.dart';

abstract class BaseService {
  final Http http = GetIt.I.get<Http>();
}
