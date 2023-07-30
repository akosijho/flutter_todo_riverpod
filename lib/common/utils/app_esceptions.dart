import 'package:flutter/material.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppExceptions {
  AppExceptions._();
  static dynamic show(String message){
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: AppConstants.kGreyDk,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
