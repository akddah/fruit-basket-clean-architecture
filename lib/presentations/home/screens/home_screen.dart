import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/extension.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/locale_keys.g.dart';
import '../../global/custom_image.dart';
import '../components/address_widget.dart';
import '../components/categories_component.dart';
import '../components/products_component.dart';
import '../components/search_products_component.dart';
import '../components/search_widget.dart';
import '../components/slider_component.dart';
import '../controllers/home_bloc.dart';
import '../controllers/home_states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: context.scaffoldBackgroundColor,
            centerTitle: true,
            elevation: 0,
            leadingWidth: 90.w,
            actions: [
              Container(
                height: 33.h,
                width: 33.h,
                decoration: BoxDecoration(
                  color: context.secondaryColor.withOpacity(0.13),
                  borderRadius: BorderRadius.circular(9.r),
                ),
                child: CustomImage(Assets.svg.cartIcon),
              ).withPadding(end: 16.w).center,
            ],
            leading: Row(
              children: [
                SizedBox(width: 16.w),
                CustomImage(
                  Assets.svg.logo,
                  height: 20.h,
                  width: 20.h,
                ),
                Text(
                  LocaleKeys.appName.tr(),
                  style: context.boldText?.copyWith(fontSize: 14, color: context.primaryColor),
                ),
              ],
            ),
            title: const HomeAddressWidget(),
          ),
          const HomeSearchWidget(),
          const SearchProductsComponent(),
          const HomeSliderComponent(),
          const HomeCategoriesComponent(),
          BlocBuilder<HomeBloc, HomeState>(
            bloc: sl<HomeBloc>(),
            builder: (context, state) {
              if (!state.isSearch) {
                return SliverToBoxAdapter(
                  child: Text(
                    LocaleKeys.varieties.tr(),
                    style: context.boldText?.copyWith(fontSize: 15),
                  ).withPadding(top: 30.h, bottom: 8.h, horizontal: 16.w),
                );
              } else {
                return const SliverToBoxAdapter();
              }
            },
          ),
          const HomeProductsComponent(),
        ],
      ),
    );
  }
}
