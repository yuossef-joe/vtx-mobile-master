import 'package:applocation/app/constants.dart';

extension NonNullString on String? {
  String orEmpty(){
    if ( this == null ){
      return Constants.empty;
    }else {
        return this!;
      }
  }
}

extension NonNullInt on int? {
  int orZero(){
    if ( this == null ){
      return Constants.zero;
    }else {
      return this!;
    }
  }
}

extension NonNullBollean on bool? {
  bool orFalse(){
    if ( this == null ){
      return false;
    }else {
      return this!;
    }
  }
}


