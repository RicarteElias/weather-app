import 'package:weather_app/features/location/data/model/address_model.dart';

abstract class LocationRemoteDataSource {
  /// Calls the Google Geocoding endpoint.
  ///
  /// Throws a [FailureException] for all error codes.
  Future<AddressModel?>? searchLocation(String? searchText);
}
