import 'package:flutter/material.dart';
import 'package:yalla_shopping/presentation/res/colors.dart';
import 'package:yalla_shopping/presentation/res/fonts.dart';
import 'package:yalla_shopping/presentation/res/styles_manager.dart';
import 'package:yalla_shopping/presentation/res/values_manager.dart';

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
      headline1: getSemiBoldStyle(color: MColors.darkGray,fontSize: FontsSize.s16),
      subtitle1: getMediumStyle(color: MColors.lightGray,fontSize: FontsSize.s14),
      caption: getRegularStyle(color: MColors.grey1),
      bodyText1: getRegularStyle(color: MColors.grey)
    ),

    /// inputDecoration theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: MColors.grey,fontSize: FontsSize.s14),
      labelStyle: getMediumStyle(color: MColors.grey,fontSize: FontsSize.s14),
      errorStyle: getRegularStyle(color: MColors.error),
      enabledBorder:  OutlineInputBorder(
        borderSide: const BorderSide(color: MColors.primary,width: FontsSize.s1_5),
        borderRadius: BorderRadius.circular(AppPadding.p8)
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: MColors.grey,width: FontsSize.s1_5),
          borderRadius: BorderRadius.circular(AppPadding.p8)
      ),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: MColors.error,width: FontsSize.s1_5),
          borderRadius: BorderRadius.circular(AppPadding.p8)
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: MColors.primary,width: FontsSize.s1_5),
          borderRadius: BorderRadius.circular(AppPadding.p8)
      ),
  )
  );
}
