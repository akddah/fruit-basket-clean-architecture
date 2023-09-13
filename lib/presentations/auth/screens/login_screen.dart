import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/utils/enums.dart';
import '../../../core/utils/extension.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale_keys.g.dart';
import '../../global/app_button.dart';
import '../../global/app_input.dart';
import '../../global/custom_image.dart';
import '../../global/flash_helper.dart';
import '../../main/screen/main_screen.dart';
import '../controllers/login_bloc.dart';
import '../controllers/login_event.dart';
import '../controllers/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bloc = sl<LoginBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.h,
        width: context.w,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Assets.images.bgAuth.path), fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImage(Assets.svg.logo).center,
                  Text(
                    LocaleKeys.helloAgain.tr(),
                    style: context.boldText?.copyWith(
                      fontSize: 16,
                      color: context.primaryColor,
                    ),
                  ).withPadding(top: 20.h, bottom: 4.h),
                  Text(LocaleKeys.youCanLogInNow.tr(), style: context.light?.copyWith(fontSize: 16)),
                  SizedBox(height: 20.h),
                  InputApp(
                    controller: bloc.phone,
                    keyboardType: TextInputType.phone,
                    hintText: LocaleKeys.mobileNumber.tr(),
                  ),
                  SizedBox(height: 16.h),
                  InputApp(
                    controller: bloc.password,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: LocaleKeys.password.tr(),
                    prefixIcon: CustomImage(
                      Assets.svg.passwordIcon,
                      width: 20.w,
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 15.h),
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      decoration: const BoxDecoration(),
                      child: Text(
                        LocaleKeys.forgotYourPassword.tr(),
                        style: context.light?.copyWith(fontSize: 16),
                      ),
                    ),
                  ).toEnd,
                  BlocConsumer<LoginBloc, LoginState>(
                    bloc: bloc,
                    listener: (context, state) {
                      if (state.status == RequestState.isError) {
                        FlashHelper.showToast(state.msg);
                      } else if (state.status == RequestState.isLoaded) {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MainScreen()), (route) => false);
                      }
                    },
                    builder: (context, state) => AppButton(
                      onTap: () async => bloc.add(ClickLoginEvent()),
                      text: LocaleKeys.signIn.tr(),
                      loading: state.status == RequestState.isLoading,
                    ),
                  ),
                  SizedBox(height: 48.h),
                  Text(
                    LocaleKeys.youDonTHaveAnAccountRegisterNow.tr(),
                    style: context.boldText?.copyWith(
                      fontSize: 15,
                      color: context.primaryColor,
                    ),
                  ).center,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
