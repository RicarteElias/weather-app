import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/service/http.dart';
import 'package:weather_app/features/location/data/datasources/implementation/location_remote_data_source_impl.dart';
import 'package:weather_app/features/location/data/model/address_model.dart';

import '../../../../../fixtures/fixtures_reader.dart';

///Tests with Mocktail

class MockLocationRemoteDataSourceImpl extends Mock
    implements LocationRemoteDataSourceImpl {
  MockLocationRemoteDataSourceImpl(Dio mockHttp);
}

class MockHttp extends Mock implements Http {}

class MockrequestOptions extends Mock implements RequestOptions {}

void main() {
  late LocationRemoteDataSourceImpl dataSource;
  late Http mockHttp;
  setUp(() {
    mockHttp = MockHttp();
    dataSource = MockLocationRemoteDataSourceImpl(mockHttp);
  });

  group('Get method', () {
    final Map<String, dynamic> jsonMap = json.decode(fixture('address.json'));
    final tAddressModel = AddressModel.fromJson(jsonMap);
    test('can be used to get responses for any url', () async {
      final Response httpResponse = Response(
          requestOptions: RequestOptions(path: '/test'),
          headers: Headers.fromMap({
            Headers.contentTypeHeader: [Headers.jsonContentType],
          }),
          statusCode: 200,
          data: fixture('address.json'));
      when(dataSource.searchLocation(searchText: anyNamed('searchText')))
          .thenAnswer((_) async => tAddressModel);
      final result = await dataSource.searchLocation(searchText: "searchText");
    });
  });

  group('Get Address', () {
    final Map<String, dynamic> jsonMap = json.decode(fixture('address.json'));
    final tAddressModel = AddressModel.fromJson(jsonMap);
    test(
        'Should perform a GET request on Geocoding URL to return a AddressModel',
        () async {
      // when(sharedPreferences.getString('CACHED_ADDRESS'))
      //     .thenAnswer((realInvocation) => fixture('address.json'));
      // final result = await dataSource.searchLocationFromLocal();
      // verify(sharedPreferences.getString('CACHED_ADDRESS'));
      // expect(result!.formmatedAddress, tAddressModel.formmatedAddress);
      // expect(result, isA<AddressModel>());
    });
  });
}
