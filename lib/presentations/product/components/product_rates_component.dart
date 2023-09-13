import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extension.dart';
import '../../../../gen/locale_keys.g.dart';
import '../../global/custom_image.dart';
import '../../global/custom_progress.dart';
import '../controllers/product_bloc.dart';
import '../controllers/product_state.dart';

class ProductRatesComponent extends StatelessWidget {
  const ProductRatesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.rateState == RequestState.isLoading) {
            return SizedBox(height: 118.h, child: CustomProgress(size: 15.h).center);
          } else if (state.rateState == RequestState.isError) {
            return SizedBox(height: 118.h, child: Text(state.rateMsg).center);
          } else if (state.rates.isNotEmpty) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "التقييمات",
                      style: context.boldText?.copyWith(fontSize: 16, color: context.primaryColor),
                    ),
                    Text(
                      LocaleKeys.showAll.tr(),
                      style: context.light?.copyWith(fontSize: 16, color: context.primaryColor),
                    ),
                  ],
                ).withPadding(horizontal: 16.w, top: 19.h),
                SizedBox(
                  height: 118.h,
                  width: context.w,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      width: 267.w,
                      height: 87.h,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
                      padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 9.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      state.rates[index].clientName,
                                      style: context.boldText?.copyWith(fontSize: 16),
                                    ),
                                    SizedBox(width: 5.w),
                                    ...List.generate(
                                      4,
                                      (i) => Icon(
                                        state.rates[index].value <= (i + 1) ? CupertinoIcons.star_fill : CupertinoIcons.star,
                                        size: 12.h,
                                        color: context.activeColor,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  state.rates[index].comment ?? "",
                                  style: context.regular?.copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 5.w),
                          CustomImage(
                            state.rates[index].clientImage,
                            height: 55.h,
                            fit: BoxFit.fill,
                            width: 55.h,
                            borderRadius: BorderRadius.circular(16.r),
                          )
                        ],
                      ),
                    ),
                    itemCount: state.rates.length,
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
