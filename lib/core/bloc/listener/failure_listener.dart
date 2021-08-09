import 'package:weather_app/core/bloc/listener/exception_listener.dart';

class FailureListener extends ExceptionListener {
  FailureListener(Exception exception) : super(exception);
}
