import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/features/location/domain/entities/address.dart';

abstract class LocationRepository {
  Future<Either<Failure, Address?>?>? searchLocation(String? searchText);
}
