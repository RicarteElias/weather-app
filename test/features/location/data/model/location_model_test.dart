import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/location/data/model/location_model.dart';
import 'package:weather_app/features/location/domain/entities/location.dart';

import '../../../../fixtures/fixtures_reader.dart';
import '../../../../mocks/mock_models.mocks.dart';

void main() {
  final Location tLocation = MockLocationModel();
  test('should be a subclass of Address entity', () async {
    expect(tLocation, isA<Location>());
  });

  group('fromJson', () {
    test('should return a valid model', () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('location.json'));
      print(jsonMap);
      final result = LocationModel.fromJson(jsonMap);
      print(result);
      expect(result, isA<Location>());
    });
  });
}
