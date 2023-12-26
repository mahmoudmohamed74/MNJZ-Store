import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mnjz_store/Features/home/data/models/product_model/product_model.dart';
import 'package:mnjz_store/core/icons/icons_broken.dart';
import 'package:mnjz_store/core/themes/color_manager.dart';
import 'package:mnjz_store/core/utils/app_constants.dart';

class ProductContentWidget extends StatelessWidget {
  const ProductContentWidget({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 3,
        child: Container(
          height: 520.h,
          width: 50.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.radius10r),
          ),
          child: InkWell(
            onTap: () {
              // TODO
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: AppConstants.padding8h),
                        child: Text(
                          "${productModel.price}\$",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          IconBroken.Heart,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: AppConstants.padding8h),
                  child: SizedBox(
                    width: 180.w,
                    height: 80.h,
                    child: CachedNetworkImage(
                      imageUrl: productModel.image!,
                      errorWidget: (context, url, error) => const Icon(
                        IconBroken.Camera,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: AppConstants.padding2h),
                  child: Text(
                    productModel.title!,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorManager.darkPrimary,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(AppConstants.padding4h),
                  child: Text(
                    productModel.description!,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                      right: AppConstants.padding5h,
                      bottom: AppConstants.padding10h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${productModel.rating!.rate}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                      Icon(
                        IconBroken.Star,
                        color: Colors.amber,
                        size: AppConstants.iconSize15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
