import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/features/location/domain/entities/address.dart';
import 'package:weather_app/features/location/domain/repository/location_repository.dart';
import 'package:weather_app/features/location/domain/usecases/search_address_usecase.dart';

import '../../../../mocks/mock_entities.mocks.dart';

class LocationRepositoryMock extends Mock implements LocationRepository {}

main() {
  LocationRepositoryMock? locationRepositoryMock;
  SearchAddressUsecase? usecase;

  setUp(() {
    locationRepositoryMock = LocationRepositoryMock();
    usecase = SearchAddressUsecase(locationRepositoryMock);
  });

  final String searchText = "test address";
  final Address tAddress = MockAddress();

  test("Should return a address", () async {
    when(locationRepositoryMock!.searchLocation(any))
        .thenAnswer((realInvocation) async => Right(tAddress));

    final result = await usecase!(searchText);
    expect(result, Right(tAddress));
    verify(locationRepositoryMock!.searchLocation(searchText));
    verifyNoMoreInteractions(locationRepositoryMock);
  });
}
