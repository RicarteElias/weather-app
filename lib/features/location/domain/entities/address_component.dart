import 'package:json_annotation/json_annotation.dart';

class AddressComponent {
  @JsonKey(name: 'long_name')
  String longName;
  @JsonKey(name: 'short_name')
  String shortName;
  List<String> types;

  AddressComponent(this.longName, this.shortName, this.types);
}
