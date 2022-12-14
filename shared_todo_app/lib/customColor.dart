import 'package:flutter/material.dart';

class customColor {
  static const MaterialColor kToDark = const MaterialColor(
    0xff194569, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff194569), //10%
      100: const Color(0xff5f84a2), //20%
      200: const Color(0xff91aec4), //30%
      300: const Color(0xffb7d0e1), //40%
      400: const Color(0xffcadeed), //50%
      500: const Color(0xffcadeed), //60%
      600: const Color(0xffcadeed), //70%
      700: const Color(0xffcadeed), //80%
      800: const Color(0xffcadeed), //90%
      900: const Color(0xffcadeed), //100%
    },
  );
}

// 50: const Color(0xff194569), //10%
// 100: const Color(0xff5f84a2), //20%
// 200: const Color(0xff91aec4), //30%
// 300: const Color(0xffb7d0e1), //40%
// 400: const Color(0xffcadeed), //50%
// 500: const Color(0xffcadeed), //60%
// 600: const Color(0xffcadeed), //70%
// 700: const Color(0xffcadeed), //80%
// 800: const Color(0xffcadeed), //90%
// 900: const Color(0xffcadeed), //100%
