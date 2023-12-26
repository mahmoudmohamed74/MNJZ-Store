import 'package:flutter/material.dart';
import 'package:mnjz_store/core/icons/icons_broken.dart';
import 'package:mnjz_store/core/utils/assets.dart';

class DummyData {
  static List<Item> specialistList = [
    Item(
      AssetsData.menClothes,
      "Men's Clothes",
      250,
    ),
    Item(
      AssetsData.womenClothes,
      "Women's Clothes",
      252,
    ),
    Item(
      AssetsData.electronics,
      "Electronics",
      235,
    ),
    Item(
      AssetsData.jewelry,
      "Jewelry",
      240,
    ),
  ];
}

class Item {
  String image;
  String title;
  int num;

  Item(
    this.image,
    this.title,
    this.num,
  );
}
