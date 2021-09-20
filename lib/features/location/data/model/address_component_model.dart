import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/location/domain/entities/address_component.dart';

part 'address_component_model.g.dart';

@JsonSerializable()
class AddressComponentModel extends AddressComponent {
  AddressComponentModel(
      {required String longName,
      required String shortName,
      required List<String> types})
      : super(longName, shortName, types);

  factory AddressComponentModel.fromJson(Map<String, dynamic> json) =>
      _$AddressComponentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressComponentModelToJson(this);
}
