import 'package:flutter/material.dart';
import 'package:mnjz_store/Features/home/presentation/views/widgets/build_products_view_section.dart';
import 'package:mnjz_store/Features/home/presentation/views/widgets/custom_categories_list_view.dart';
import 'package:mnjz_store/Features/home/presentation/views/widgets/custom_products_grid_view.dart';
import 'package:mnjz_store/Features/home/presentation/views/widgets/hint_text_widget.dart';
import 'package:mnjz_store/Features/home/presentation/views/widgets/welcom_message_widget.dart';
import 'package:mnjz_store/Features/search/presentation/views/widgets/search_bar_widget.dart';
import 'package:mnjz_store/core/utils/app_strings.dart';
import 'package:mnjz_store/core/utils/app_constants.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WelcomeMessageWidget(),

          SizedBox(height: AppConstants.padding12h),

          SearchBarWidget(),

          SizedBox(height: AppConstants.padding12h),

          // Hint Text Widget for Categories
          HintTextWidget(title: AppStrings.hintCategories),

          const CustomCategoriesListView(),

          // Hint Text Widget for New Products
          HintTextWidget(title: AppStrings.hintNewProducts),

          // Build Products View Section Widget
          const BuildProductsViewSection(),
        ],
      ),
    );
  }
}
