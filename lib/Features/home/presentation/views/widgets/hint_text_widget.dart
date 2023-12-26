// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mnjz_store/core/themes/color_manager.dart';
import 'package:mnjz_store/core/themes/styles.dart';
import 'package:mnjz_store/core/utils/app_strings.dart';
import 'package:mnjz_store/core/utils/app_constants.dart';

class HintTextWidget extends StatelessWidget {
  HintTextWidget({
    required this.title,
    this.onTap,
    Key? key,
  }) : super(key: key);

  String title;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyles.titleStyle16.copyWith(color: ColorManager.black),
        ),
        const Spacer(),
        SizedBox(
          height: AppConstants.size30h,
          child: TextButton(
            onPressed: () {
              // TODO
            },
            child: Text(
              AppStrings.seeAll,
              style: TextStyle(
                color: ColorManager.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
