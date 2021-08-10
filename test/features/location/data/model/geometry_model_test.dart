import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/location/domain/entities/geometry.dart';

import '../../../../mocks/mock_entities.mocks.dart';

void main() {
  final Geometry tGeometry = MockGeometry();
  test('should be a subclass of Geometry entity', () async {
    expect(tGeometry, isA<Geometry>());
  });
}
