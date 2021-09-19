import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/location/data/datasources/location_local_datasource.dart';
import 'package:weather_app/features/location/data/model/address_model.dart';

class LocationLocalDataSourceImpl implements LocationLocalDataSource {
  final SharedPreferences sharedPreferences;

  LocationLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void>? cacheLocation(AddressModel? addressToCache) {
    // TODO: implement cacheLocation
    throw UnimplementedError();
  }

  @override
  Future<AddressModel>? searchLocationFromLocal() {
    late final String? jsonString =
        sharedPreferences.getString('CACHED_ADDRESS');
    if (jsonString == null) {
      return null;
    }
    return Future.value(AddressModel.fromJson(json.decode(jsonString)));
  }
}
