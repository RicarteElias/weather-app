import 'package:json_annotation/json_annotation.dart';

part 'address_component.g.dart';

@JsonSerializable(includeIfNull: true, fieldRename: FieldRename.snake)
class AddressComponent {
  @JsonKey(name: 'long_name')
  String longName;
  @JsonKey(name: 'short_name')
  String shortName;
  List<String> types;

  AddressComponent(this.longName, this.shortName, this.types);

  factory AddressComponent.fromJson(Map<String, dynamic> json) =>
      _$AddressComponentFromJson(json);

  Map<String, dynamic> toJson() => _$AddressComponentToJson(this);
}
