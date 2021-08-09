import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'event/base_event.dart';

part 'state/base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  BaseBloc() : super(BaseInitialState());

  @override
  Stream<BaseState> mapEventToState(
    BaseEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
