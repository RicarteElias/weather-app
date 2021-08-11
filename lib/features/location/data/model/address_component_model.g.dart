// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_component_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressComponentModel _$AddressComponentModelFromJson(
    Map<String, dynamic> json) {
  return AddressComponentModel(
    longName: json['longName'] as String,
    shortName: json['shortName'] as String,
    type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$AddressComponentModelToJson(
        AddressComponentModel instance) =>
    <String, dynamic>{
      'longName': instance.longName,
      'shortName': instance.shortName,
      'type': instance.type,
    };
