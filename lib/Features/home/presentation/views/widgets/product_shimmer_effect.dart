import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mnjz_store/core/themes/color_manager.dart';
import 'package:mnjz_store/core/utils/app_constants.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmerEffectWidget extends StatelessWidget {
  const ProductShimmerEffectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorManager.grey1,
      highlightColor: ColorManager.grey2,
      child: Padding(
        padding: EdgeInsets.all(AppConstants.padding5h),
        child: Card(
          elevation: 3,
          child: Container(
            height: 500.h,
            width: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
