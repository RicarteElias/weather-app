import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/location/data/datasources/implementation/location_local_data_source_impl.dart';
import 'package:weather_app/features/location/data/datasources/location_local_datasource.dart';
import 'package:weather_app/features/location/data/model/address_model.dart';

import '../../../../../fixtures/fixtures_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late LocationLocalDataSource dataSource;
  late MockSharedPreferences sharedPreferences;
  setUp(() {
    sharedPreferences = MockSharedPreferences();
    dataSource =
        LocationLocalDataSourceImpl(sharedPreferences: sharedPreferences);
  });

  group('Get Address', () {
    final Map<String, dynamic> jsonMap = json.decode(fixture('address.json'));
    final tAddressModel = AddressModel.fromJson(jsonMap);
    test(
        'Should return the Address from SharedPreferences when there is one in the cache ',
        () async {
      when(sharedPreferences.getString('CACHED_ADDRESS'))
          .thenAnswer((realInvocation) => fixture('address.json'));
      final result = await dataSource.searchLocationFromLocal();
      verify(sharedPreferences.getString('CACHED_ADDRESS'));
      expect(result!.formmatedAddress, tAddressModel.formmatedAddress);
      expect(result, isA<AddressModel>());
    });
  });
}
