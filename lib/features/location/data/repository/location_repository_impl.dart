import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/core/service/http.dart';
import 'package:weather_app/features/location/domain/entities/address.dart';
import 'package:weather_app/features/location/domain/repository/location_repository.dart';

class LocationbRepositoryImpl implements LocationRepository {
  final String _baseUrl =
      'https://maps.googleapis.com/maps/api/geocode/json?address=';
  final String _key = 'AIzaSyD_mBSsoM9iauGzzUl4wgnA42BbAs7v6Zw';

  Http _httpClient = GetIt.instance.get<Http>();

  @override
  Future<Either<Failure, Address?>> searchLocation(String? searchText) async {
    try {
      Response response =
          await _httpClient.get('$_baseUrl$searchText&key=$_key');
      return right(Address());
    } on DioError catch (e) {
      return left(Failure(e.message));
    }
  }

// Future<Either<Failure, Address?>>? searchWeather(num lat, num lng) {
//   throw UnimplementedError();
// }
}
