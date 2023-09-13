import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extension.dart';
import '../../../../gen/locale_keys.g.dart';
import '../../global/custom_image.dart';
import '../../global/custom_progress.dart';
import '../controllers/home_bloc.dart';
import '../controllers/home_states.dart';

class HomeCategoriesComponent extends StatelessWidget {
  const HomeCategoriesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            bloc: sl<HomeBloc>(),
            buildWhen: (previous, current) => previous.isSearch != current.isSearch,
            builder: (context, state) {
              if (!state.isSearch) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.sections.tr(),
                      style: context.boldText?.copyWith(fontSize: 15),
                    ),
                    Text(
                      LocaleKeys.showAll.tr(),
                      style: context.light?.copyWith(fontSize: 15, color: context.primaryColor),
                    ),
                  ],
                ).withPadding(top: 32.h, bottom: 16.h, horizontal: 16.w);
              }
              return const SizedBox.shrink();
            },
          ),
          BlocBuilder<HomeBloc, HomeState>(
            bloc: sl<HomeBloc>(),
            buildWhen: (previous, current) => previous.isSearch != current.isSearch || previous.categoriesState != current.categoriesState,
            builder: (context, state) {
              if (state.isSearch) {
                return const SizedBox.shrink();
              } else if (state.homeCategories.isNotEmpty) {
                return SizedBox(
                  height: 110.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Expanded(
                            child: CustomImage(
                              state.homeCategories[index].media,
                              height: 73.h,
                              width: 73.h,
                              fit: BoxFit.fill,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          Text(
                            state.homeCategories[index].name,
                            style: context.medium?.copyWith(fontSize: 20, height: 2),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 16.w),
                    itemCount: state.homeCategories.length,
                  ),
                );
              } else if (state.categoriesState == RequestState.isLoading) {
                return SizedBox(height: 110.h, child: CustomProgress(size: 15.h).center);
              } else if (state.categoriesState == RequestState.isError) {
                return SizedBox(height: 110.h, child: Text(state.categoriesMsg).center);
              } else {
                return SizedBox(height: 110.h, child: const Text("no data found").center);
              }
            },
          ),
        ],
      ),
    );
  }
}
