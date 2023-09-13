import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_basket/core/utils/extension.dart';
import 'package:fruit_basket/gen/assets.gen.dart';

import 'custom_image.dart';

class InputApp extends StatefulWidget {
  final Widget? icon, prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? hintText;
  final Color? fillColor;
  final void Function(String)? onChanged;

  const InputApp({super.key, this.controller, this.hintText, this.icon, this.keyboardType, this.prefixIcon, this.fillColor, this.onChanged});

  @override
  State<InputApp> createState() => _InputAppState();
}

class _InputAppState extends State<InputApp> {
  bool borderActive = false;
  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        if (widget.keyboardType == TextInputType.phone) {
          setState(() {
            borderActive = value;
          });
        }
      },
      child: TextFormField(
        onChanged: widget.onChanged,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          fillColor: widget.fillColor,
          hintText: widget.hintText,
          icon: buildIcon(context),
          prefixIcon: (() {
            if (widget.keyboardType == TextInputType.phone) {
              return CustomImage(
                Assets.svg.phoneIcon,
                width: 20.w,
              );
            } else {
              return widget.prefixIcon;
            }
          })(),
        ),
      ),
    );
  }

  Widget? buildIcon(BuildContext context) {
    if (widget.keyboardType == TextInputType.phone) {
      return AnimatedContainer(
        width: 69.w,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: borderActive ? context.primaryColor : context.hoverColor),
        ),
        padding: EdgeInsets.symmetric(vertical: 5.h),
        alignment: Alignment.center,
        duration: 100.milliseconds,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomImage(
              Assets.images.saFlag.path,
              height: 20.h,
              width: 32.w,
            ),
            Text(
              "+966",
              style: context.medium?.copyWith(color: context.primaryColor, fontSize: 15),
              textDirection: TextDirection.ltr,
            )
          ],
        ),
      ).withPadding(end: 10.w);
    }
    return null;
  }
}
