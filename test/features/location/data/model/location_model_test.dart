import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/location/data/model/location_model.dart';
import 'package:weather_app/features/location/domain/entities/location.dart';

import '../../../../fixtures/fixtures_reader.dart';
import '../../../../mocks/mock_models.mocks.dart';

void main() {
  final Location tLocation = MockLocationModel();
  test('should be a subclass of Location entity', () async {
    expect(tLocation, isA<Location>());
  });

  group('fromJson', () {
    test('should return a valid entity of Location', () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('location.json'));
      final result = LocationModel.fromJson(jsonMap);
      expect(result, isA<Location>());
    });
  });
}
