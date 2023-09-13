import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extension.dart';
import '../../global/custom_image.dart';
import '../../global/custom_progress.dart';
import '../controllers/home_bloc.dart';
import '../controllers/home_states.dart';

class HomeSliderComponent extends StatelessWidget {
  const HomeSliderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 164.h,
        width: context.w,
        child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) => previous.sliderState != current.sliderState || previous.isSearch != current.isSearch,
          bloc: sl<HomeBloc>(),
          builder: (context, state) {
            if (state.isSearch) {
              return const SizedBox.shrink();
            } else if (state.homeSlider.isNotEmpty) {
              return PageView.builder(
                itemCount: state.homeSlider.length,
                itemBuilder: (context, index) {
                  return CustomImage(
                    state.homeSlider[index].media,
                    height: 164.h,
                    width: context.w,
                    fit: BoxFit.fill,
                  );
                },
              );
            } else if (state.sliderState == RequestState.isLoading) {
              return CustomProgress(size: 15.h).center;
            } else if (state.sliderState == RequestState.isError) {
              return Text(state.sliderMsg).center;
            } else {
              return const Text("no data found").center;
            }
          },
        ),
      ),
    );
  }
}
