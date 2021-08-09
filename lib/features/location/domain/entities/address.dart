import 'package:weather_app/features/location/domain/entities/address_component.dart';
import 'package:weather_app/features/location/domain/entities/geometry.dart';

class Address {
  late List<AddressComponent> addressComponents;
  late String formmatedAddress;
  late Geometry geometry;
}
