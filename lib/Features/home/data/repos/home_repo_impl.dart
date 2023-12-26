import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:mnjz_store/Features/home/data/models/product_model/product_model.dart';
import 'package:mnjz_store/Features/home/data/models/product_model/rating.dart';
import 'package:mnjz_store/Features/home/data/repos/home_repo.dart';
import 'package:mnjz_store/core/network/api/api_constants.dart';
import 'package:mnjz_store/core/database/database_helper.dart';
import 'package:mnjz_store/core/errors/failure.dart';
import 'package:mnjz_store/core/network/api/api_service.dart';
import 'package:sqflite/sqflite.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  final DatabaseHelper databaseHelper;

  HomeRepoImpl(this.apiService, this.databaseHelper);

  @override
  Future<Either<Failure, List<ProductModel>>> fetchProducts() async {
    try {
      var data = await apiService.get(endPoint: ApiConstants.productsEndPoint);
      List<ProductModel> products =
          data.map((item) => ProductModel.fromJson(item)).toList();

      return right(products);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> saveProductsLocally(List<ProductModel> products) async {
    for (var product in products) {
      await databaseHelper.insertData({
        'id': product.id,
        'title': product.title,
        'price': product.price,
        'description': product.description,
        'category': product.category,
        'image': product.image,
        'rating_rate': product.rating?.rate,
        'rating_count': product.rating?.count,
      }, "products");
    }
  }

  @override
  Future<List<ProductModel>> getLocalProducts() async {
    final List<Map<String, dynamic>> maps =
        await databaseHelper.getAllData("products");

    return List.generate(maps.length, (i) {
      return ProductModel(
        id: maps[i]['id'] as int?,
        title: maps[i]['title'] as String?,
        price: (maps[i]['price'] as num?)?.toDouble(),
        description: maps[i]['description'] as String?,
        category: maps[i]['category'] as String?,
        image: maps[i]['image'] as String?,
        rating: Rating(
          rate: (maps[i]['rating_rate'] as num?)?.toDouble(),
          count: maps[i]['rating_count'] as int?,
        ),
      );
    });
  }
}
