import 'package:json_annotation/json_annotation.dart';

part 'address_component.g.dart';

@JsonSerializable()
class AddressComponent {
  String longName;
  String shortName;
  List<String> type;

  AddressComponent(this.longName, this.shortName, this.type);

  factory AddressComponent.fromJson(Map<String, dynamic> json) =>
      _$AddresComponentFromJson(json);

  Map<String, dynamic> toJson() => _$AddressComponentToJson(this);
}
