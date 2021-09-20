import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failure.dart';

mixin UseCase<Type, Params> {
  Future<Either<Failure, Type?>?>? call(Params params);
}
