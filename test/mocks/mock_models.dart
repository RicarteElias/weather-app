import 'package:mockito/annotations.dart';
import 'package:weather_app/features/location/data/model/address_model.dart';
import 'package:weather_app/features/location/data/model/geometry_model.dart';
import 'package:weather_app/features/location/data/model/location_model.dart';
import 'package:weather_app/features/location/domain/entities/address_component.dart';

@GenerateMocks([AddressModel, AddressComponent, GeometryModel, LocationModel])
class MockModels {}
