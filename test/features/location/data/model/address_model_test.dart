import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/location/domain/entities/address.dart';

import '../../../../mocks/mock_models.mocks.dart';

void main() {
  final Address tAddressComponent = MockAddressModel();
  test('should be a subclass of Address entity', () async {
    expect(tAddressComponent, isA<Address>());
  });
}
