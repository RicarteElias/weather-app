import 'package:flutter/cupertino.dart';
import 'package:weather_app/core/bloc/base_bloc.dart';

class NavigateEvent extends BaseEvent {
  final Widget widget;
  final bool predicate;

  NavigateEvent(this.widget, this.predicate);
}
