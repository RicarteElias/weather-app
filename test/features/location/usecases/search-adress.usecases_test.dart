import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/features/location/domain/entities/address.dart';
import 'package:weather_app/features/location/domain/repository/location.repository.dart';
import 'package:weather_app/features/location/domain/usecases/search-address.usecase.dart';

class SearchAddressMock extends Mock implements LocationRepository {}

main() {
  final repository = SearchAddressMock();
  final usecase = SearchAddress(repository);
  test('Should return  a address', () async {
    when(repository.searchLocation(any))
        .thenAnswer((realInvocation) async => Right(Address()));
    final result = await usecase("Rua cambe 861");
    expect(result | null, isA<Address>());
  });
}
