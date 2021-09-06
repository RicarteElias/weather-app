import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/core/platform/network_info.dart';
import 'package:weather_app/core/service/base_service.dart';
import 'package:weather_app/features/location/data/datasources/lcoation_remote_data_source.dart';
import 'package:weather_app/features/location/data/datasources/location_local_datasource.dart';
import 'package:weather_app/features/location/data/model/address_model.dart';
import 'package:weather_app/features/location/domain/entities/address.dart';
import 'package:weather_app/features/location/domain/repository/location_repository.dart';

class LocationRepositoryImpl extends BaseService implements LocationRepository {
  late LocationRemoteDataSource locationRemoteDataSource;
  late LocationLocalDataSource locationLocalDataSource;
  final NetworkInfo? networkInfo;

  LocationRepositoryImpl(
      {required this.locationRemoteDataSource,
      required this.locationLocalDataSource,
      required this.networkInfo})
      : super();

  // final String _baseUrl =
  //     'https://maps.googleapis.com/maps/api/geocode/json?address=';
  // final String _key = 'AIzaSyD_mBSsoM9iauGzzUl4wgnA42BbAs7v6Zw';

  @override
  Future<Either<Failure, Address?>> searchLocation(String searchText) async {
    try {
      networkInfo!.isConnected;
      AddressModel? address =
          await locationRemoteDataSource.searchLocation(searchText);
      locationLocalDataSource.cacheLocation(address);
      return Right(address);
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Address>> searchLocationfromLocal() async {
    var result = await locationLocalDataSource.searchLocationFromLocal();
    return Right(result);
  }

// Future<Either<Failure, Weather?>>? searchWeather(num lat, num lng) {
//   throw UnimplementedError();
// }
}
