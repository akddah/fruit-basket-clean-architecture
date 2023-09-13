import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/utils/enums.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale_keys.g.dart';
import '../../favorite/controller/favorite_bloc.dart';
import '../../favorite/controller/favorite_events.dart';
import '../../favorite/controller/favorite_state.dart';
import '../../favorite/screen/favorite_screen.dart';
import '../../global/custom_image.dart';
import '../../address/controller/address_bloc.dart';
import '../../address/controller/address_events.dart';
import '../../global/flash_helper.dart';
import '../../home/controllers/home_bloc.dart';
import '../../home/controllers/home_events.dart';
import '../../home/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  final int? index;
  final bool withRefresh;
  const MainScreen({super.key, this.index, this.withRefresh = true});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    index = widget.index ?? index;
    if (widget.withRefresh) {
      sl<HomeBloc>()
        ..add(GetHomeSlidersEvent())
        ..add(GetHomeCategoriesEvent())
        ..add(GetHomeProductsEvent());
      sl<AddressBloc>().add(GetAddressesEvent());
      sl<FavoriteBloc>().add(GetFavoriteEvent());
    }
    super.initState();
  }

  int index = 0;

  final screens = [
    const HomeScreen(),
    Container(),
    Container(),
    const FavoriteScreen(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteBloc, FavoriteState>(
      bloc: sl<FavoriteBloc>(),
      listener: (context, state) {
        if (state.updateFavoriteStatus == RequestState.isError) {
          FlashHelper.showToast(state.updateFavoriteMsg);
        } else if (state.updateFavoriteStatus == RequestState.isLoaded) {
          FlashHelper.showToast(state.updateFavoriteMsg, type: MessageType.success);
        }
      },
      child: Scaffold(
        body: screens[index],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: CustomIconImage(Assets.images.homeIcon.path),
              label: LocaleKeys.main.tr(),
            ),
            BottomNavigationBarItem(
              icon: CustomIconImage(Assets.images.orderIcon.path),
              label: LocaleKeys.myRequests.tr(),
            ),
            BottomNavigationBarItem(
              icon: CustomIconImage(Assets.images.notificationIcon.path),
              label: LocaleKeys.notifications.tr(),
            ),
            BottomNavigationBarItem(
              icon: CustomIconImage(Assets.images.favoriteIcon.path),
              label: LocaleKeys.favorite.tr(),
            ),
            BottomNavigationBarItem(
              icon: CustomIconImage(Assets.images.profileIcon.path),
              label: LocaleKeys.arithmetic.tr(),
            ),
          ],
          currentIndex: index,
          onTap: (value) => setState(() {
            index = value;
          }),
        ),
      ),
    );
  }
}
