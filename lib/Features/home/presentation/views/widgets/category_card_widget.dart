// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mnjz_store/core/themes/color_manager.dart';

import 'package:mnjz_store/core/utils/app_constants.dart';

class CategoryCardWidget extends StatelessWidget {
  String categoryName;
  int categoryNum;
  String categoryImage;
  CategoryCardWidget({
    Key? key,
    required this.categoryName,
    required this.categoryNum,
    required this.categoryImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radius12r),
      ),
      child: Container(
        height: AppConstants.size180h,
        width: AppConstants.size110w,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppConstants.radius12r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SvgPicture.asset(
                categoryImage,
                height: 40.h,
                width: 40.w,
              ),
            ),
            SizedBox(
              height: AppConstants.size10h,
            ),
            Text(
              categoryName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorManager.black,
                fontSize: AppConstants.iconSize12,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: AppConstants.size10h,
            ),
            Text(
              "$categoryNum",
              style: TextStyle(
                color: ColorManager.black,
                fontSize: AppConstants.iconSize12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
