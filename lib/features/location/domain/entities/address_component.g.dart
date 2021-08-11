// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressComponent _$AddressComponentFromJson(Map<String, dynamic> json) {
  return AddressComponent(
    json['longName'] as String,
    json['shortName'] as String,
    (json['type'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$AddressComponentToJson(AddressComponent instance) =>
    <String, dynamic>{
      'longName': instance.longName,
      'shortName': instance.shortName,
      'type': instance.type,
    };
