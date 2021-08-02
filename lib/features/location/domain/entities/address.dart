import 'package:weather_app/features/location/domain/entities/address-component.dart';
import 'package:weather_app/features/location/domain/entities/geometry.dart';

class Address {
  List<AddressComponent> addressComponents;
  String formmatedAddress;
  Geometry geometry;

  Address([this.addressComponents, this.formmatedAddress, this.geometry]);
}
