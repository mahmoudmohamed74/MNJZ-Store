import 'package:dartz/dartz.dart';
import 'package:mnjz_store/Features/home/data/models/product_model/product_model.dart';
import 'package:mnjz_store/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> fetchProducts();
  Future<void> saveProductsLocally(List<ProductModel> products);
  Future<List<ProductModel>> getLocalProducts();
}
