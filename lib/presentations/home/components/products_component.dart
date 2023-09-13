import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extension.dart';
import '../../global/custom_progress.dart';
import '../../global/custom_sliver_grid.dart';
import '../../global/product_widget.dart';
import '../controllers/home_bloc.dart';
import '../controllers/home_states.dart';

class HomeProductsComponent extends StatelessWidget {
  const HomeProductsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: sl<HomeBloc>(),
      buildWhen: (previous, current) => previous.isSearch != current.isSearch || previous.productsState != current.productsState,
      builder: (context, state) {
        if (state.isSearch) {
          return const SliverToBoxAdapter();
        } else if (state.homeProducts.isNotEmpty) {
          // return SliverPadding(
          //   padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(bottom: 30.h),
          //   sliver: SliverGrid(
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       mainAxisSpacing: 16.h,
          //       crossAxisSpacing: 16.w,
          //       childAspectRatio: 163.w / 290.h,
          //     ),
          //     delegate: SliverChildBuilderDelegate(
          //       (context, index) => ProductWidget(data: state.homeProducts[index]),
          //       childCount: state.homeProducts.length,
          //     ),
          //   ),
          // );
          return SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 8.w).copyWith(bottom: 30.h),
            sliver: CustomSliverGrid(
              itemPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              itemBuilder: (context, index) => ProductWidget(data: state.homeProducts[index]),
              itemCount: state.homeProducts.length,
              crossCount: 2,
            ),
          );
        } else if (state.productsState == RequestState.isLoading) {
          return SliverToBoxAdapter(child: CustomProgress(size: 15.h).center);
        } else if (state.productsState == RequestState.isError) {
          return SliverToBoxAdapter(child: Text(state.categoriesMsg).center);
        } else {
          return SliverToBoxAdapter(
            child: Text(
              "no data found",
              style: context.boldText,
            ).center,
          );
        }
      },
    );
  }
}
