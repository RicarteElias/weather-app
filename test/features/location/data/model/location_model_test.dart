import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/location/domain/entities/location.dart';

import '../../../../mocks/mock_models.mocks.dart';

void main() {
  final Location tLocation = MockLocationModel();
  test('should be a subclass of Address entity', () async {
    expect(tLocation, isA<Location>());
  });
}
