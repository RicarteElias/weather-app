import 'package:dio/dio.dart';
import 'package:weather_app/core/service/http.dart';
import 'package:weather_app/features/location/data/datasources/lcoation_remote_data_source.dart';
import 'package:weather_app/features/location/data/model/address_model.dart';

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final Http _client;

  LocationRemoteDataSourceImpl(this._client);

  @override
  Future<AddressModel>? searchLocation({String? searchText}) async {
    final Response response = await _client.get(
        'https://maps.googleapis.com/maps/api/geocode/json?&address=rua%20cambe&key=AIzaSyD_mBSsoM9iauGzzUl4wgnA42BbAs7v6Zw');
    return AddressModel.fromJson(response.data);
  }
}
