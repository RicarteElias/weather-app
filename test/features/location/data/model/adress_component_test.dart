import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/location/domain/entities/address_component.dart';

import '../../../../mocks/mock_entities.mocks.dart';

void main() {
  final AddressComponent tAddress = MockAddressComponent();
  test('should be a subclass of AddressComponent entity', () async {
    expect(tAddress, isA<MockAddressComponent>());
  });
}
