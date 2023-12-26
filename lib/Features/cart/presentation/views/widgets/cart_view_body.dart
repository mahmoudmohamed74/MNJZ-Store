import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mnjz_store/core/utils/app_constants.dart';
import 'package:mnjz_store/core/utils/app_strings.dart';
import 'package:mnjz_store/core/utils/assets.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: AppConstants.size300h,
          width: AppConstants.size200w,
          child: Lottie.asset(AssetsData.cart),
        ),
        const Text(
          AppStrings.comingSoon,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
