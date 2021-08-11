// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return AddressModel(
    addressComponents: (json['addressComponents'] as List<dynamic>)
        .map((e) => AddressComponentModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    formmatedAddress: json['formmatedAddress'] as String,
    geometry: GeometryModel.fromJson(json['geometry'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'addressComponents': instance.addressComponents,
      'formmatedAddress': instance.formmatedAddress,
      'geometry': instance.geometry,
    };
