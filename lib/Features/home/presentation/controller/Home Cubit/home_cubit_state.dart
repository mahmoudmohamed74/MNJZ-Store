part of 'home_cubit.dart';

abstract class HomeCubitState extends Equatable {
  const HomeCubitState();

  @override
  List<Object> get props => [];
}

class HomeCubitInitial extends HomeCubitState {}

class ProductsLoadingState extends HomeCubitState {}

class ProductsSuccessState extends HomeCubitState {
  final List<ProductModel> productList;

  const ProductsSuccessState({required this.productList});
}

class ProductsErrorState extends HomeCubitState {
  final String errorMessage;

  const ProductsErrorState({required this.errorMessage});
}
