import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/location/data/model/address_model.dart';
import 'package:weather_app/features/location/domain/entities/address.dart';

import '../../../../fixtures/fixtures_reader.dart';
import '../../../../mocks/mock_models.mocks.dart';

void main() {
  final Address tAddress = MockAddressModel();
  test('should be a subclass of Address entity', () async {
    expect(tAddress, isA<Address>());
  });
  group('fromJson', () {
    test('should return a valid model', () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('address.json'));
      final result = AddressModel.fromJson(jsonMap);
      expect(result, isA<Address>());
    });
  });
}
