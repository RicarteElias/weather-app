import 'package:weather_app/features/location/domain/entities/address_component.dart';

class AddressComponentModel extends AddressComponent {
  AddressComponentModel(
      {required String longName,
      required String shortName,
      required List<String> type})
      : super(longName, shortName, type);
}
