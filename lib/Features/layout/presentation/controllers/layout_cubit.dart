import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnjz_store/Features/cart/presentation/views/cart_view.dart';
import 'package:mnjz_store/Features/favorites/presentation/views/favorites_view.dart';
import 'package:mnjz_store/Features/home/presentation/views/home_view.dart';
import 'package:mnjz_store/core/utils/app_strings.dart';
import 'package:mnjz_store/core/icons/icons_broken.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  void changeBottomNavigation(int index) {
    emit(ChangeBottomNavigationState());
    currentIndex = index;
    emit(BottomNavigationChangedState());
  }

  List<Widget> bodyScreens = const [
    HomeView(),
    FavoritesView(),
    CartView(),
  ];
  List<BottomNavigationBarItem> bottomNavigationBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Home,
      ),
      label: AppStrings.home,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Heart,
      ),
      label: AppStrings.favorites,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Category,
      ),
      label: AppStrings.cart,
    ),
  ];
}
