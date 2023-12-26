import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnjz_store/Features/layout/presentation/controllers/layout_cubit.dart';

class LayoutViewBody extends StatelessWidget {
  const LayoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var layoutCubit = LayoutCubit.get(context);
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (BuildContext context, state) {
        return SafeArea(
          child: Scaffold(
            body: layoutCubit.bodyScreens[layoutCubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                layoutCubit.changeBottomNavigation(index);
              },
              currentIndex: layoutCubit.currentIndex,
              items: layoutCubit.bottomNavigationBarItems,
            ),
          ),
        );
      },
    );
  }
}
