/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bg_auth.png
  AssetGenImage get bgAuth => const AssetGenImage('assets/images/bg_auth.png');

  /// File path: assets/images/favorite_icon.png
  AssetGenImage get favoriteIcon =>
      const AssetGenImage('assets/images/favorite_icon.png');

  /// File path: assets/images/home_icon.png
  AssetGenImage get homeIcon =>
      const AssetGenImage('assets/images/home_icon.png');

  /// File path: assets/images/notification_icon.png
  AssetGenImage get notificationIcon =>
      const AssetGenImage('assets/images/notification_icon.png');

  /// File path: assets/images/order_icon.png
  AssetGenImage get orderIcon =>
      const AssetGenImage('assets/images/order_icon.png');

  /// File path: assets/images/profile_icon.png
  AssetGenImage get profileIcon =>
      const AssetGenImage('assets/images/profile_icon.png');

  /// File path: assets/images/sa_flag.png
  AssetGenImage get saFlag => const AssetGenImage('assets/images/sa_flag.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bgAuth,
        favoriteIcon,
        homeIcon,
        notificationIcon,
        orderIcon,
        profileIcon,
        saFlag
      ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/cart_icon.svg
  String get cartIcon => 'assets/svg/cart_icon.svg';

  /// File path: assets/svg/connectivity_image.svg
  String get connectivityImage => 'assets/svg/connectivity_image.svg';

  /// File path: assets/svg/delete_icon.svg
  String get deleteIcon => 'assets/svg/delete_icon.svg';

  /// File path: assets/svg/edit_icon.svg
  String get editIcon => 'assets/svg/edit_icon.svg';

  /// File path: assets/svg/favorite_icon.svg
  String get favoriteIcon => 'assets/svg/favorite_icon.svg';

  /// File path: assets/svg/home_icon.svg
  String get homeIcon => 'assets/svg/home_icon.svg';

  /// File path: assets/svg/logo.svg
  String get logo => 'assets/svg/logo.svg';

  /// File path: assets/svg/notification_icon.svg
  String get notificationIcon => 'assets/svg/notification_icon.svg';

  /// File path: assets/svg/order_icon.svg
  String get orderIcon => 'assets/svg/order_icon.svg';

  /// File path: assets/svg/password_icon.svg
  String get passwordIcon => 'assets/svg/password_icon.svg';

  /// File path: assets/svg/phone_icon.svg
  String get phoneIcon => 'assets/svg/phone_icon.svg';

  /// File path: assets/svg/profile_icon.svg
  String get profileIcon => 'assets/svg/profile_icon.svg';

  /// File path: assets/svg/search_icon.svg
  String get searchIcon => 'assets/svg/search_icon.svg';

  /// List of all assets
  List<String> get values => [
        cartIcon,
        connectivityImage,
        deleteIcon,
        editIcon,
        favoriteIcon,
        homeIcon,
        logo,
        notificationIcon,
        orderIcon,
        passwordIcon,
        phoneIcon,
        profileIcon,
        searchIcon
      ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/ar-SA.json
  String get arSA => 'assets/translations/ar-SA.json';

  /// File path: assets/translations/en-USA.json
  String get enUSA => 'assets/translations/en-USA.json';

  /// List of all assets
  List<String> get values => [arSA, enUSA];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
