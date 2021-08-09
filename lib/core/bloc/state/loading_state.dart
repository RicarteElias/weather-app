import 'package:weather_app/core/bloc/base_bloc.dart';

abstract class LoadingState extends BaseState {
  Future<BaseState>? dispatch() {}
}
