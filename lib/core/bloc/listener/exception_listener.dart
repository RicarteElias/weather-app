import 'package:weather_app/core/bloc/listener/base_listener.dart';

class ExceptionListener extends BaseListener {
  final Exception exception;

  ExceptionListener(this.exception);
}
