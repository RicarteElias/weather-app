import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/location/domain/entities/address_component.dart';
import 'package:weather_app/features/location/domain/entities/geometry.dart';

class Address {
  @JsonKey(name: 'address_components')
  final List<AddressComponent> addressComponents;
  @JsonKey(name: 'formatted_address')
  final String formmatedAddress;
  final Geometry geometry;

  const Address(
      {required this.addressComponents,
      required this.formmatedAddress,
      required this.geometry});
}
