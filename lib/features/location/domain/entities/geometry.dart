import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/location/domain/entities/location.dart';

@JsonSerializable()
class Geometry {
  late Location location;

  Geometry(this.location);
}
