import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/extension.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/locale_keys.g.dart';
import '../../global/app_input.dart';
import '../../global/custom_image.dart';
import '../controllers/home_bloc.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: context.scaffoldBackgroundColor,
      toolbarHeight: 0,
      expandedHeight: 50.h,
      collapsedHeight: 50.h,
      elevation: 1,
      flexibleSpace: InputApp(
        controller: sl<HomeBloc>().searchController,
        hintText: LocaleKeys.lookForWhatYouWant.tr(),
        onChanged: sl<HomeBloc>().searchListener,
        prefixIcon: CustomImage(Assets.svg.searchIcon, height: 18.w, width: 18.w),
        fillColor: context.primaryColor.withOpacity(0.03),
      ).withPadding(horizontal: 16.w).center,
    );
  }
}
