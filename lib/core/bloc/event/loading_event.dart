import 'package:weather_app/core/bloc/base_bloc.dart';

abstract class LoadingEvent extends BaseEvent {
  Future<BaseState> dispatch() async {
    throw Exception();
  }
}
