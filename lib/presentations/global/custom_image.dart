import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class CustomImage extends StatelessWidget {
  final double? height, width;
  final String? url;
  final bool isFile;
  final BoxFit? fit;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  const CustomImage(this.url, {super.key, this.height, this.width, this.isFile = false, this.borderRadius, this.fit, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.zero,
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: (() {
          if (url == null) {
            return SizedBox(height: height, width: width);
          } else if (url?.startsWith("http") == true) {
            return Image.network(url!, height: height, width: width, fit: fit ?? BoxFit.contain, color: color);
          } else if (url?.split(".").last.toLowerCase() == "svg") {
            return SvgPicture.asset(
              url!,
              height: height,
              width: width,
              fit: fit ?? BoxFit.contain,
              colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
            );
          } else if (isFile) {
            return Image.file(File(url!), height: height, width: height, fit: fit ?? BoxFit.contain, color: color);
          } else {
            return Image.asset(url!, width: width, height: width, fit: fit ?? BoxFit.contain, color: color);
          }
        })(),
      ),
    );
  }
}

class CustomIconImage extends StatelessWidget {
  final String url;
  const CustomIconImage(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return ImageIcon(getImage());
  }

  getImage() {
    if (url.split(".").last == "svg") {
      return svg.Svg(url);
    } else {
      return AssetImage(url);
    }
  }
}
