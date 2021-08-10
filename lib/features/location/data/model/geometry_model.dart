import 'package:weather_app/features/location/data/model/location_model.dart';
import 'package:weather_app/features/location/domain/entities/geometry.dart';

class GeometryModel extends Geometry {
  GeometryModel({required LocationModel location}) : super(location);
}
