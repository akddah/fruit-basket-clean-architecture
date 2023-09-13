import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/utils/enums.dart';
import '../../../core/utils/extension.dart';
import '../../../gen/locale_keys.g.dart';
import '../../domain/entities/home_products.dart';
import '../favorite/controller/favorite_bloc.dart';
import '../favorite/controller/favorite_events.dart';
import '../favorite/controller/favorite_state.dart';
import '../product/screens/product_screen.dart';
import 'app_button.dart';
import 'custom_image.dart';
import 'custom_progress.dart';

class ProductWidget extends StatelessWidget {
  final HomeProducts data;
  const ProductWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProductScreen(productId: data.id, mainImage: data.mainImage),
      )),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r), color: context.lightColor),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImage(
              data.mainImage,
              height: 117.h,
              fit: BoxFit.fill,
              width: double.infinity,
              borderRadius: BorderRadius.circular(10.r),
            ),
            Text(data.title),
            Text("${LocaleKeys.thePrice.tr()} / ${data.unit.name}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "${data.price} ر.س ",
                            style: context.boldText?.copyWith(fontSize: 16, color: context.primaryColor),
                          ),
                          if (data.discount > 0)
                            TextSpan(
                              text: "${data.priceBeforeDiscount}ر.س",
                              style: context.light?.copyWith(
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough,
                                color: context.primaryColor,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                BlocBuilder<FavoriteBloc, FavoriteState>(
                  bloc: sl(),
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        if (state.updateFavoriteStatus != RequestState.isLoading) {
                          sl<FavoriteBloc>().add(RemoveFromFavoriteEvent(data.id));
                        }
                      },
                      child: Container(
                        height: 30.h,
                        width: 30.h,
                        decoration: BoxDecoration(
                          color: context.secondaryColor,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: state.updateFavoriteStatus == RequestState.isLoading && state.productId == data.id
                            ? CustomProgress(size: 15.h, color: context.lightColor)
                            : Icon(Icons.add, color: context.lightColor),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 12.h),
            AppButton(
              text: LocaleKeys.addToTheBasket.tr(),
              height: 30.h,
              width: 115.w,
              color: context.secondaryColor,
              fontSize: 12,
              borderRadius: 9.r,
            ).center,
          ],
        ),
      ),
    );
  }
}
