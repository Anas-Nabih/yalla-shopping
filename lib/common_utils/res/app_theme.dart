import 'package:flutter/material.dart';
import 'package:yalla_shopping/common_utils/res/colors.dart';
import 'package:yalla_shopping/common_utils/res/fonts.dart';
import 'package:yalla_shopping/common_utils/res/styles_manager.dart';
import 'package:yalla_shopping/common_utils/res/dimens.dart';

ThemeData appTheme() {
  return ThemeData(
    /// main colors
    primaryColor: MColors.primary,
    primaryColorLight: MColors.lightPrimary,
    primaryColorDark: MColors.darkPrimary,
    disabledColor: MColors.grey1,
    splashColor: MColors.lightPrimary,
    //ripple effect

    /// cardView theme
    cardTheme: const CardTheme(
        color: MColors.white,
        shadowColor: MColors.grey,
        elevation: FontsSize.s2),

    /// appBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: MColors.primary,
      elevation: FontsSize.s2,
      shadowColor: MColors.lightPrimary,
      titleTextStyle:
          getRegularStyle(fontSize: FontsSize.s16, color: Colors.white),
    ),

    /// button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: MColors.grey1,
      buttonColor: MColors.primary,
      splashColor: MColors.lightPrimary,
    ),

    /// elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: MColors.primary,
            textStyle:
                getRegularStyle(color: MColors.white, fontSize: FontsSize.s17),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(FontsSize.s12)))),

    /// text theme
    textTheme: TextTheme(
      displayLarge: getLightStyle(color: MColors.white,fontSize: FontsSize.s22),
      headlineLarge: getSemiBoldStyle(color: MColors.darkGray,fontSize: FontsSize.s16),
      headlineMedium: getSemiBoldStyle(color: MColors.darkGray,fontSize: FontsSize.s14),
      titleMedium: getMediumStyle(color: MColors.lightGray,fontSize: FontsSize.s14),
      bodyLarge: getRegularStyle(color: MColors.grey1),
      bodySmall: getRegularStyle(color: MColors.grey)
    ),

    /// inputDecoration theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(Dimens.d8),
      hintStyle: getRegularStyle(color: MColors.grey,fontSize: FontsSize.s14),
      labelStyle: getMediumStyle(color: MColors.grey,fontSize: FontsSize.s14),
      errorStyle: getRegularStyle(color: MColors.error),
      enabledBorder:  OutlineInputBorder(
        borderSide: const BorderSide(color: MColors.primary,width: FontsSize.s1_5),
        borderRadius: BorderRadius.circular(Dimens.d8)
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: MColors.grey,width: FontsSize.s1_5),
          borderRadius: BorderRadius.circular(Dimens.d8)
      ),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: MColors.error,width: FontsSize.s1_5),
          borderRadius: BorderRadius.circular(Dimens.d8)
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: MColors.primary,width: FontsSize.s1_5),
          borderRadius: BorderRadius.circular(Dimens.d8)
      ),
  )
  );
}
