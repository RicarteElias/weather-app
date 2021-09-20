import 'package:weather_app/core/bloc/base_bloc.dart';

class RedirectEvent extends BaseEvent {
  final BaseState reaction;

  RedirectEvent(this.reaction);
}
