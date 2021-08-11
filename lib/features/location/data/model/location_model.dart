import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/location/domain/entities/location.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel extends Location {
  LocationModel({required num lat, required num lng})
      : super(lat: lat, lng: lng);

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
