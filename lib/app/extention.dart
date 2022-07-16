import 'package:yalla_shopping/common_utils/res/CONST.dart';

extension NonNullString on String?{
  String orEmpty(){
    if(this == null){
      return Const.EMPTY;
    }else{
      return this!;
    }
  }
}


extension NonNullInteger on int?{
  int orZero(){
    if(this == null){
      return Const.ZERO;
    }else{
      return this!;
    }
  }
}