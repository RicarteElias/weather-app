import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/location/data/model/geometry_model.dart';
import 'package:weather_app/features/location/domain/entities/geometry.dart';

import '../../../../fixtures/fixtures_reader.dart';
import '../../../../mocks/mock_entities.mocks.dart';

void main() {
  final Geometry tGeometry = MockGeometry();
  test('should be a subclass of Geometry entity', () async {
    expect(tGeometry, isA<Geometry>());
  });

  group('fromJson', () {
    test('should return a valid entity of Geomtry', () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('geometry.json'));
      final result = GeometryModel.fromJson(jsonMap);
      expect(result, isA<Geometry>());
    });
  });
}
