import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppImages {
  // PNG / JPG

  // GIF

  // SVG
  static const String appLogoDark = "assets/images/logo/Logo-dark.svg";
  static const String appLogoLight = "assets/images/logo/Logo-light.svg";

  static Widget load(String assetPath,
      {double? width, double? height, BoxFit fit = BoxFit.contain}) {
    if (assetPath.endsWith(".svg")) {
      return SvgPicture.asset(assetPath,
          width: width, height: height, fit: fit);
    } else {
      return Image.asset(assetPath, width: width, height: height, fit: fit);
    }
  }
}
