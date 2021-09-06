import 'package:equatable/equatable.dart';

class Failure extends Equatable implements Exception {
  String? msg;

  Failure([this.msg]);

  @override
  List<Object?> get props => [this.msg];
}
