

import 'package:flutter/cupertino.dart';
import 'package:yalla_shopping/common_utils/res/fonts.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color){
  return TextStyle(
    color: color,
    fontFamily: Fonts.fontFamily,
    fontWeight: fontWeight,
    fontSize:  fontSize
  );
}

// regular style
TextStyle getRegularStyle({double fontSize = FontsSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontsWeight.regular, color);
}

TextStyle getLightStyle({double fontSize = FontsSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontsWeight.light, color);
}

TextStyle getMediumStyle({double fontSize = FontsSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontsWeight.medium, color);
}

TextStyle getSemiBoldStyle({double fontSize = FontsSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontsWeight.semiBold, color);
}

TextStyle getBoldStyle({double fontSize = FontsSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontsWeight.bold, color);
}