import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/core/utils/mixin/use-case.dart';
import 'package:weather_app/features/location/domain/entities/address.dart';
import 'package:weather_app/features/location/domain/repository/location.repository.dart';

class SearchAddress with UseCase<Address, Params> {
  final LocationRepository locationRepository;

  SearchAddress(this.locationRepository);

  @override
  Future<Either<Failure, Address>> call(Params params) {
    return locationRepository.searchWeather(params.lat, params.lng);
  }
}

class Params {
  num lat;
  num lng;

  Params(this.lat, this.lng);
}
