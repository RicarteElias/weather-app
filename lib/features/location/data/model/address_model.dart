import 'package:weather_app/features/location/data/model/address_component_model.dart';
import 'package:weather_app/features/location/data/model/geometry_model.dart';
import 'package:weather_app/features/location/domain/entities/address.dart';

class AddressModel extends Address {
  AddressModel(
      {required List<AddressComponentModel> addressComponents,
      required String formmatedAddress,
      required GeometryModel geometry})
      : super(
            addressComponents: addressComponents,
            formmatedAddress: formmatedAddress,
            geometry: geometry);
}
