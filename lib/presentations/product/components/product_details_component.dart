import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extension.dart';
import '../../../../gen/locale_keys.g.dart';
import '../../global/custom_progress.dart';
import '../controllers/product_bloc.dart';
import '../controllers/product_state.dart';

class ProductDetailComponent extends StatelessWidget {
  const ProductDetailComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.product != null) {
          return SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.product!.name,
                      style: context.boldText?.copyWith(color: context.primaryColor, fontSize: 22),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "${state.product!.percentage}%",
                            style: context.light?.copyWith(fontSize: 13, color: context.errorColor),
                          ),
                          TextSpan(
                            text: " ${state.product!.price}ر.س ",
                            style: context.boldText?.copyWith(fontSize: 17, color: context.primaryColor),
                          ),
                          TextSpan(
                            text: "${state.product!.priceBeforeDiscount} ر.س",
                            style: context.light?.copyWith(fontSize: 13, color: context.primaryColor, decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                    )
                  ],
                ).withPadding(horizontal: 16.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${LocaleKeys.thePrice.tr()} / 1${state.product!.unit.name}",
                      style: context.light?.copyWith(fontSize: 19, color: context.hintColor),
                    ),
                    Container(
                      width: 109.w,
                      height: 35.h,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: context.primaryColor.withOpacity(.11),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30.h,
                            alignment: AlignmentDirectional.center,
                            width: 30.h,
                            decoration: BoxDecoration(
                              color: context.lightColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(Icons.add, color: context.primaryColor, size: 15.h),
                          ),
                          Text(
                            "1",
                            style: context.medium?.copyWith(fontSize: 15, color: context.primaryColor),
                          ),
                          Container(
                            height: 30.h,
                            alignment: AlignmentDirectional.center,
                            width: 30.h,
                            decoration: BoxDecoration(
                              color: context.lightColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(Icons.remove, color: context.primaryColor, size: 15.h),
                          ),
                        ],
                      ),
                    )
                  ],
                ).withPadding(horizontal: 16.w),
                Divider(height: 37.h),
                Row(
                  children: [
                    Text(
                      "كود المنتج",
                      style: context.boldText?.copyWith(color: context.primaryColor, fontSize: 17),
                    ),
                    SizedBox(width: 15.w),
                    Text(
                      state.product!.productCode,
                      style: context.light?.copyWith(fontSize: 19),
                    ),
                  ],
                ).withPadding(horizontal: 16.w),
                Divider(height: 37.h),
                Text(
                  "تفاصيل المنتج",
                  style: context.boldText?.copyWith(color: context.primaryColor, fontSize: 17),
                ).withPadding(horizontal: 16.w),
                SizedBox(height: 10.h),
                Text(
                  state.product!.description,
                  style: context.light?.copyWith(fontSize: 14),
                ).withPadding(horizontal: 16.w),
              ],
            ),
          );
        } else if (state.productState == RequestState.isError) {
          return SliverToBoxAdapter(child: Text(state.productMsg));
        } else {
          return SliverToBoxAdapter(child: SizedBox(height: 250.h, child: CustomProgress(size: 20.h)));
        }
      },
    );
  }
}
