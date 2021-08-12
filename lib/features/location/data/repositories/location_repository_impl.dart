import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/core/platform/network_info.dart';
import 'package:weather_app/core/service/base_service.dart';
import 'package:weather_app/features/location/data/datasources/lcoation_remote_data_source.dart';
import 'package:weather_app/features/location/data/datasources/location_local_datasource.dart';
import 'package:weather_app/features/location/domain/entities/address.dart';
import 'package:weather_app/features/location/domain/repository/location_repository.dart';

class LocationRepositoryImpl extends BaseService implements LocationRepository {
  final LocationRemoteDataSource locationRemoteDataSource;
  final LocationLocalDataSource locationLocalDataSource;
  final NetworkInfo networkInfo;

  LocationRepositoryImpl(
      {required this.locationRemoteDataSource,
      required this.locationLocalDataSource,
      required this.networkInfo});

  // final String _baseUrl =
  //     'https://maps.googleapis.com/maps/api/geocode/json?address=';
  // final String _key = 'AIzaSyD_mBSsoM9iauGzzUl4wgnA42BbAs7v6Zw';

  @override
  Future<Either<Failure, Address>?> searchLocation(String? searchText) async {}

// Future<Either<Failure, Address?>>? searchWeather(num lat, num lng) {
//   throw UnimplementedError();
// }
}
