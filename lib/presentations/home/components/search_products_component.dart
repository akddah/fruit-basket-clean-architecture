import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extension.dart';
import '../../global/custom_progress.dart';
import '../../global/product_widget.dart';
import '../controllers/home_bloc.dart';
import '../controllers/home_states.dart';

class SearchProductsComponent extends StatelessWidget {
  const SearchProductsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: sl<HomeBloc>(),
      buildWhen: (previous, current) =>
          previous.searchProductsState != current.searchProductsState || previous.searchProducts != current.searchProducts,
      builder: (context, state) {
        if (!state.isSearch) {
          return const SliverToBoxAdapter();
        } else if (state.searchProductsState == RequestState.isLoaded && state.searchProducts.isNotEmpty) {
          return SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(bottom: 30.h),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.w,
                childAspectRatio: 163.w / 290.h,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => ProductWidget(data: state.searchProducts[index]),
                childCount: state.searchProducts.length,
              ),
            ),
          );
        } else if (state.searchProductsState == RequestState.isLoading) {
          return SliverToBoxAdapter(child: CustomProgress(size: 25.h).center);
        } else if (state.searchProductsState == RequestState.isError) {
          return SliverToBoxAdapter(child: Text(state.searchProductsMsg).center);
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
