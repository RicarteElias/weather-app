import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/platform/network_info.dart';
import 'package:weather_app/features/location/data/datasources/lcoation_remote_data_source.dart';
import 'package:weather_app/features/location/data/datasources/location_local_datasource.dart';
import 'package:weather_app/features/location/data/repositories/location_repository_impl.dart';

class MockLocationRemoteDataSource extends Mock
    implements LocationRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockLocationLocalDataSource extends Mock
    implements LocationLocalDataSource {}

void main() {
  MockNetworkInfo mockNetworKInfo;
  MockLocationLocalDataSource mockLocationLocalDataSource;
  MockLocationRemoteDataSource mockLocationRemoteDataSource;
  LocationRepositoryImpl repository;

  setUp(() {
    mockNetworKInfo = MockNetworkInfo();
    mockLocationLocalDataSource = MockLocationLocalDataSource();
    mockLocationRemoteDataSource = MockLocationRemoteDataSource();
    repository = LocationRepositoryImpl(
        locationLocalDataSource: mockLocationLocalDataSource,
        locationRemoteDataSource: mockLocationRemoteDataSource,
        networkInfo: mockNetworKInfo);
  });
}
