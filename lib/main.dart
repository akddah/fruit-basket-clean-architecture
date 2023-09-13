import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/services/service_locator.dart';
import 'core/utils/app_themes.dart';
import 'core/utils/string_constans.dart';
import 'core/utils/unfucs.dart';
import 'core/utils/user_cashed.dart';
import 'firebase_options.dart';
import 'presentations/splash/screens/splash_screen.dart';

Future<void> main() async {
  print("=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
  await initServices();
  ServicesLocator().init();
  await sl<UserCashed>().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final theme = AppThemes();

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: 'assets/translations',
      saveLocale: true,
      startLocale: const Locale('ar', 'SA'),
      fallbackLocale: const Locale('ar', 'SA'),
      supportedLocales: const [Locale('ar', 'SA'), Locale('en', 'USA')],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            navigatorKey: navigator,
            home: const SplashScreen(),
            title: StringConstans.appName,
            theme: theme.lightTheme,
            builder: (context, child) {
              return Unfocus(child: child);
            },
          );
        },
      ),
    );
  }
}

GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
