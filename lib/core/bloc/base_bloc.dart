import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/core/bloc/event/loading_event.dart';
import 'package:weather_app/core/bloc/event/redirect_event.dart';
import 'package:weather_app/core/bloc/listener/exception_listener.dart';
import 'package:weather_app/core/bloc/listener/failure_listener.dart';
import 'package:weather_app/core/bloc/state/loading_state.dart';
import 'package:weather_app/core/errors/failure.dart';

part 'event/base_event.dart';

part 'state/base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  BaseBloc() : super(BaseInitialState());

  @override
  Stream<BaseState> mapEventToState(
    BaseEvent event,
  ) async* {
    if (event is LoadingEvent) {
      yield LoadingState();
      BaseState state = await event.dispatch();
      yield state;
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    if (error is Failure) {
      this.add(RedirectEvent(FailureListener(error)));
    } else {
      this.add(RedirectEvent(ExceptionListener(error as Exception)));
    }
  }
}
