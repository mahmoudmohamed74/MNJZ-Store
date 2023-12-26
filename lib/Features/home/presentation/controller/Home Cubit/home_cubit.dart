import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mnjz_store/Features/home/data/models/product_model/product_model.dart';
import 'package:mnjz_store/Features/home/data/repos/home_repo.dart';
import 'package:mnjz_store/core/network/connectivity_service.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  final HomeRepo homeRepo;
  final ConnectivityService connectivityService;

  HomeCubit(this.homeRepo, this.connectivityService)
      : super(HomeCubitInitial());

  Future<void> fetchProductsCubit() async {
    emit(ProductsLoadingState());
    try {
      if (await connectivityService.isOnline()) {
        var result = await homeRepo.fetchProducts();

        result.fold(
          (failure) {
            emit(ProductsErrorState(errorMessage: failure.errorMessage));
            print(failure.errorMessage);
          },
          (products) async {
            await homeRepo.saveProductsLocally(products);

            emit(ProductsSuccessState(productList: products));
          },
        );
      } else {
        final localProducts = await homeRepo.getLocalProducts();

        if (localProducts.isNotEmpty) {
          emit(ProductsSuccessState(productList: localProducts));
        } else {
          emit(const ProductsErrorState(
            errorMessage: 'No internet connection and no local data.',
          ));
        }
      }
    } catch (e) {
      emit(ProductsErrorState(errorMessage: e.toString()));
      print(e.toString());
    }
  }
}
