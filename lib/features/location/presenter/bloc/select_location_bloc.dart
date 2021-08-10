import 'dart:async';

import 'package:meta/meta.dart';
import 'package:weather_app/core/bloc/base_bloc.dart';

part 'events/select_location_event.dart';

part 'states/select_location_state.dart';

class SelectLocationBloc extends BaseBloc {
  @override
  Stream<BaseState> mapEventToState(
    BaseEvent event,
  ) async* {
    yield* super.mapEventToState(event);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}
