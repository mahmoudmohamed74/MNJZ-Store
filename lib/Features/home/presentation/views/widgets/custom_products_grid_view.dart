import 'package:flutter/material.dart';
import 'package:mnjz_store/core/themes/color_manager.dart';

class CustomProductsGridView extends StatelessWidget {
  final List<Widget> childrenWidgets;
  const CustomProductsGridView({
    super.key,
    required this.childrenWidgets,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 1 / 1.606,
        children: childrenWidgets,
      ),
    );
  }
}
