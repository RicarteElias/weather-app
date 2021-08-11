import 'package:weather_app/features/location/domain/entities/address_component.dart';
import 'package:weather_app/features/location/domain/entities/geometry.dart';

class Address {
  final List<AddressComponent> addressComponents;
  final String formmatedAddress;
  final Geometry geometry;

  const Address(
      {required this.addressComponents,
      required this.formmatedAddress,
      required this.geometry});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        addressComponents: json['addressComponents'],
        geometry: json['geometry'],
        formmatedAddress: json['formmatedAddress']);
  }
}
