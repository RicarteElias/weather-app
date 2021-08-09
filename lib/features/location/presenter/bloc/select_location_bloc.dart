import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'events/select_location_event.dart';

part 'states/select_location_state.dart';

class SelectLocationBloc
    extends Bloc<SelectLocationEvent, SelectLocationState> {
  SelectLocationBloc() : super(SelectLocationInitial());

  @override
  Stream<SelectLocationState> mapEventToState(
    SelectLocationEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
