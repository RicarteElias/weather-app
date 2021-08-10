import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/core/utils/mixin/use_case.dart';
import 'package:weather_app/features/location/domain/entities/address.dart';
import 'package:weather_app/features/location/domain/repository/location_repository.dart';

class SearchAddressUsecase with UseCase<Address, String> {
  final LocationRepository? locationRepository;

  SearchAddressUsecase(this.locationRepository);

  @override
  Future<Either<Failure, Address>?>? call(String? params) {
    return locationRepository!.searchLocation(params);
  }
}
