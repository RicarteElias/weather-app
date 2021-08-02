import 'package:weather_app/features/location/domain/entities/address-component.dart';
import 'package:weather_app/features/location/domain/entities/address.dart';
import 'package:weather_app/features/location/domain/entities/geometry.dart';

class AddressModel extends Address {
  AddressModel(List<AddressComponent> addressComponents,
      String formmatedAddress, Geometry geometry)
      : super(addressComponents, formmatedAddress, geometry);
}
