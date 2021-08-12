import 'package:weather_app/features/location/domain/entities/address.dart';

abstract class LocationRemoteDataSource {
  /// Calls the geocoding endpoint.
  ///
  /// Throws a [FailureException] for all error codes.
  Future<Address> searchlocation(String searchText);
}
