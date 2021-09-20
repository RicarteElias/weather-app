import 'package:weather_app/core/errors/failure.dart';

class CacheException extends Failure {
  CacheException(String msg) : super(msg);
}
