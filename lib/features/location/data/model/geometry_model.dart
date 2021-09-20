import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/location/data/model/location_model.dart';
import 'package:weather_app/features/location/domain/entities/geometry.dart';

part 'geometry_model.g.dart';

@JsonSerializable()
class GeometryModel extends Geometry {
  GeometryModel({required LocationModel location}) : super(location);

  factory GeometryModel.fromJson(Map<String, dynamic> json) =>
      _$GeometryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryModelToJson(this);
}
