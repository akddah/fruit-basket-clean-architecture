import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_basket/core/utils/extension.dart';

import 'custom_progress.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final bool loading;
  final double? height, width, borderRadius, fontSize;
  final Color? color, borderColor, textColor;

  const AppButton({
    super.key,
    this.onTap,
    this.height,
    this.width,
    this.color,
    this.borderColor,
    required this.text,
    this.textColor,
    this.borderRadius,
    this.loading = false,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? null : onTap,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 60.h,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 15.r,
              spreadRadius: .1,
              color: context.hintColor.withOpacity(.2),
              offset: const Offset(0, 1),
            )
          ],
          color: (color ?? context.primaryColor).withOpacity(!loading ? (color ?? context.primaryColor).opacity : 0.3),
          borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
          border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        child: Stack(
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: context.boldText?.copyWith(fontSize: fontSize ?? 15, color: textColor ?? context.lightColor, height: 1),
            ).center,
            if (loading) CustomProgress(size: 15.h).withPadding(end: 10.w).toEnd
          ],
        ),
      ),
    );
  }
}
