// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_component_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressComponentModel _$AddressComponentModelFromJson(
    Map<String, dynamic> json) {
  return AddressComponentModel(
    longName: json['long_name'] as String,
    shortName: json['short_name'] as String,
    types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$AddressComponentModelToJson(
        AddressComponentModel instance) =>
    <String, dynamic>{
      'long_name': instance.longName,
      'short_name': instance.shortName,
      'types': instance.types,
    };
