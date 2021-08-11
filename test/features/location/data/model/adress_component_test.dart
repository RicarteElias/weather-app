import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/location/data/model/address_component_model.dart';
import 'package:weather_app/features/location/domain/entities/address_component.dart';

import '../../../../fixtures/fixtures_reader.dart';
import '../../../../mocks/mock_entities.mocks.dart';

void main() {
  final AddressComponent tAddressComponent = MockAddressComponent();
  test('should be a subclass of AddressComponent entity', () async {
    expect(tAddressComponent, isA<MockAddressComponent>());
  });

  group('fromJson', () {
    test('should return a valid model', () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('address_component.json'));
      print(jsonMap);

      final result = AddressComponentModel.fromJson(jsonMap);
      print(result);
      expect(result, isA<AddressComponent>());
    });
  });
}
