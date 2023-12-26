import 'package:flutter/material.dart';
import 'package:mnjz_store/Features/home/presentation/views/widgets/category_card_widget.dart';
import 'package:mnjz_store/core/dymmy/dymmy.dart';
import 'package:mnjz_store/core/utils/app_constants.dart';

class CustomCategoriesListView extends StatelessWidget {
  const CustomCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .18,
      margin: EdgeInsets.symmetric(vertical: AppConstants.padding10h),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => CategoryCardWidget(
          categoryName: DummyData.specialistList[index].title,
          categoryImage: DummyData.specialistList[index].image,
          categoryNum: DummyData.specialistList[index].num,
        ),
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: AppConstants.size10w,
        ),
        itemCount: DummyData.specialistList.length,
      ),
    );
  }
}
