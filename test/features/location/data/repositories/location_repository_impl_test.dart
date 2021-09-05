import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/platform/network_info.dart';
import 'package:weather_app/core/service/http.dart';
import 'package:weather_app/features/location/data/datasources/lcoation_remote_data_source.dart';
import 'package:weather_app/features/location/data/datasources/location_local_datasource.dart';
import 'package:weather_app/features/location/data/model/address_model.dart';
import 'package:weather_app/features/location/data/repositories/location_repository_impl.dart';
import 'package:weather_app/features/location/domain/entities/address.dart';

import '../../../../mocks/mock_models.mocks.dart';

class MockLocationRemoteDataSource extends Mock
    implements LocationRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockLocationLocalDataSource extends Mock
    implements LocationLocalDataSource {}

final GetIt injectorInterface = GetIt.instance;

setUpInjectorInterface() {
  injectorInterface.registerSingleton<Http>(Http());
}

main() {
  setUpInjectorInterface();
  MockNetworkInfo? mockNetworKInfo;
  late MockLocationLocalDataSource mockLocationLocalDataSource;
  late MockLocationRemoteDataSource mockLocationRemoteDataSource;
  late LocationRepositoryImpl repository;

  setUp(() async {
    mockNetworKInfo = MockNetworkInfo();
    mockLocationLocalDataSource = MockLocationLocalDataSource();
    mockLocationRemoteDataSource = MockLocationRemoteDataSource();
    repository = LocationRepositoryImpl(
        locationLocalDataSource: mockLocationLocalDataSource,
        locationRemoteDataSource: mockLocationRemoteDataSource,
        networkInfo: mockNetworKInfo);
  });

  group('searchText', () {
    final String searchText = "address to search";
    final AddressModel addressModel = MockAddressModel();
    final Address address = addressModel;

    // test('should check if the device is online', () async {
    //   when(mockNetworKInfo!.isConnected)
    //       .thenAnswer((realInvocation) async => true);
    //   await repository.searchLocation(searchText);
    //   verify(mockNetworKInfo!.isConnected);
    // });

    group('device is online', () {
      setUp(() {
        when(mockNetworKInfo!.isConnected)
            .thenAnswer((realInvocation) async => true);
      });
      test(
          'should return a address when the call to remote data source is success',
          () async {
        when(mockLocationRemoteDataSource.searchLocation(searchText))
            .thenAnswer((realInvocation) async => addressModel);
        final result = await repository.searchLocation(searchText);
        verify(mockLocationRemoteDataSource.searchLocation(searchText));
        expect(result, right(address));
      });
    });

    test(
        'should cache data locally when the call to remote data source is success',
        () async {
      when(mockLocationRemoteDataSource.searchLocation(searchText))
          .thenAnswer((realInvocation) async => addressModel);
      final result = await repository.searchLocation(searchText);
      verify(mockLocationRemoteDataSource.searchLocation(searchText));
      verify(mockLocationLocalDataSource.cacheLocation(addressModel));
    });

    // test(
    //     'should return a server failure when the call to remote data source is unsuccess',
    //     () async {
    //   when(mockLocationRemoteDataSource!.searchLocation(any))
    //       .thenThrow(Failure());
    //   final result = await repository!.searchLocation(searchText);
    //   verify(mockLocationRemoteDataSource!.searchLocation(searchText));
    //   verifyNever(mockLocationLocalDataSource!.cacheLocation(addressModel));
    //   expect(result, Left(Failure()));
    // });

    group('device is offline', () {
      setUp(() {
        when(mockNetworKInfo!.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
    });
  });
}
