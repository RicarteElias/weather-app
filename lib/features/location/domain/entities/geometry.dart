import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/location/domain/entities/location.dart';

part 'geometry.g.dart';

@JsonSerializable()
class Geometry {
  Location location;

  Geometry(this.location);

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}
