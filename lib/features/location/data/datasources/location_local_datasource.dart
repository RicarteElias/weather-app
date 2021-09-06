import 'package:weather_app/features/location/data/model/address_model.dart';

abstract class LocationLocalDataSource {
  /// Gets the cached [AddressModel] which was gotten the last time
  /// the user had search a address.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<AddressModel> searchLocationFromLocal();

  Future<void> cacheLocation(AddressModel? addressToCache);
}
