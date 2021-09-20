import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/errors/cache_exception.dart';
import 'package:weather_app/features/location/data/datasources/location_local_datasource.dart';
import 'package:weather_app/features/location/data/model/address_model.dart';

class LocationLocalDataSourceImpl implements LocationLocalDataSource {
  final SharedPreferences sharedPreferences;

  LocationLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void>? cacheLocation(AddressModel? addressToCache) {
    if (addressToCache != null) {
      sharedPreferences.setString(
          'CACHED_ADDRESS', json.encode(addressToCache.toJson()));
    } else {
      throw CacheException("Não encontramos nenhum endereço para salvar");
    }
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
