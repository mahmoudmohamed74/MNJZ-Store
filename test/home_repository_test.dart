import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mnjz_store/Features/home/data/models/product_model/product_model.dart';
import 'package:mnjz_store/Features/home/data/repos/home_repo_impl.dart';
import 'package:mnjz_store/core/database/database_helper.dart';
import 'package:mnjz_store/core/errors/failure.dart';
import 'package:mnjz_store/core/network/api/api_service.dart';
import 'package:mockito/mockito.dart';

class MockApiService extends Mock implements ApiService {}

class MockDatabaseHelper extends Mock implements DatabaseHelper {}

void main() {
  group('HomeRepoImpl', () {
    late HomeRepoImpl homeRepoImpl;
    late MockApiService mockApiService;
    late MockDatabaseHelper mockDatabaseHelper;

    setUp(() {
      mockApiService = MockApiService();
      mockDatabaseHelper = MockDatabaseHelper();
      homeRepoImpl = HomeRepoImpl(mockApiService, mockDatabaseHelper);
    });

    test('fetchProducts returns Right on successful fetch', () async {
      when(mockApiService.get(endPoint: 'products')).thenAnswer((_) async {
        return [
          {
            "id": 1,
            "title": "Product 1",
            "price": 10.0,
          },
          {
            "id": 2,
            "title": "Product 2",
            "price": 20.0,
          },
        ];
      });

      final result = await homeRepoImpl.fetchProducts();

      expect(result, isA<Right<Failure, List<ProductModel>>>());
      expect(result.getOrElse(() => []), isA<List<ProductModel>>());
      expect(result.getOrElse(() => []), hasLength(2));
    });

    test('fetchProducts returns Left on fetch failure', () async {
      // Arrange
      when(mockApiService.get(endPoint: 'someEndPoint')).thenThrow(
        DioError(
          response: Response(
            statusCode: 404,
            requestOptions: RequestOptions(),
          ),
          requestOptions: RequestOptions(),
        ),
      );

      final result = await homeRepoImpl.fetchProducts();

      expect(result, isA<Left<Failure, List<ProductModel>>>());
      expect(result.fold((failure) => failure, (products) => products),
          isA<Failure>());
    });
  });
}
