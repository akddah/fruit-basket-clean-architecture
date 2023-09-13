import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_basket/core/utils/extension.dart';

class AppThemes {
  ThemeData get lightTheme => ThemeData(
        primaryColor: "#4C8613".color,
        scaffoldBackgroundColor: Colors.white,
        textTheme: arabicTextTheme,
        hoverColor: "#F3F3F3".color,
        hintColor: Colors.grey,
        primaryColorLight: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(fontWeight: FontWeight.w700, color: "#4C8613".color, fontSize: 20),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: "#4C8613".color,
          selectedItemColor: Colors.white,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedLabelStyle: const TextStyle(color: Colors.white),
          unselectedLabelStyle: TextStyle(color: "#AED489".color),
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: IconThemeData(color: "#AED489".color),
          unselectedItemColor: "#AED489".color,
          enableFeedback: true,
        ),
        colorScheme: ColorScheme.light(
          secondary: "#61B80C".color,
          primary: "#4C8613".color,
          error: "#FF0000".color,
          onSurfaceVariant: "#FF9529".color,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: "#4C8613".color),
            borderRadius: BorderRadius.circular(15.r),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 18.w),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: "#F3F3F3".color), borderRadius: BorderRadius.circular(15.r)),
        ),
      );

  TextTheme get arabicTextTheme => const TextTheme(
        labelMedium: TextStyle(fontWeight: FontWeight.w700),
        headlineSmall: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
      );
}
