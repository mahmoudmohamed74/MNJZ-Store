// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:mnjz_store/core/themes/color_manager.dart';
import 'package:mnjz_store/core/utils/app_strings.dart';
import 'package:mnjz_store/core/icons/icons_broken.dart';
import 'package:mnjz_store/core/utils/app_constants.dart';

class SearchBarWidget extends StatefulWidget {
  VoidCallback? onSearch;
  TextEditingController? controller;
  String? initialValue;

  SearchBarWidget({
    this.onSearch,
    this.controller,
    this.initialValue,
    super.key,
  });
  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppConstants.size50h,
          child: TextField(
            controller: widget.controller,
            readOnly: true,
            onTap: () {
              // GoRouter.of(context).push(AppRouter.kSearchView);
              // TODO
            },
            decoration: InputDecoration(
                hintText: AppStrings.hintSearch,
                filled: true,
                fillColor: ColorManager.lightGrey,
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorManager.white),
                  borderRadius: BorderRadius.circular(AppConstants.radius20r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorManager.white),
                  borderRadius: BorderRadius.circular(AppConstants.radius20r),
                ),
                suffixIcon: Icon(
                  IconBroken.Search,
                  color: ColorManager.primary,
                )),
          ),
        ),
      ],
    );
  }
}
