import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnjz_store/Features/home/presentation/controller/Home%20Cubit/home_cubit.dart';
import 'package:mnjz_store/Features/home/presentation/views/widgets/custom_products_grid_view.dart';
import 'package:mnjz_store/Features/home/presentation/views/widgets/product_content_widget.dart';
import 'package:mnjz_store/Features/home/presentation/views/widgets/product_shimmer_effect.dart';
import 'package:mnjz_store/core/widgets/custom_error_widget.dart';

class BuildProductsViewSection extends StatelessWidget {
  const BuildProductsViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeCubitState>(
      builder: (context, state) {
        if (state is ProductsSuccessState) {
          return CustomProductsGridView(
            childrenWidgets: List.generate(
              state.productList.length,
              (index) => ProductContentWidget(
                productModel: state.productList[index],
              ),
            ),
          );
        } else if (state is ProductsErrorState) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
          );
        } else {
          return CustomProductsGridView(
            childrenWidgets: List.generate(
              10,
              (index) => const ProductShimmerEffectWidget(),
            ),
          );
        }
      },
    );
  }
}
