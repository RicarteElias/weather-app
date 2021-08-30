import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class WidgetCubit extends Cubit<Widget> {
  WidgetCubit(initialState) : super(initialState);

  void change(Widget w) => emit(w);
}
