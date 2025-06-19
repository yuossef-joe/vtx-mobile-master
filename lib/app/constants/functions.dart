import 'package:flutter/material.dart';

String? validate_password(String? value) {
  if (value!.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  // else if (!RegExp(r'[A-Z]').hasMatch(value)) {
  //   return 'Password must contain at least one uppercase letter';
  // } else if (!RegExp(r'[a-z]').hasMatch(value)) {
  //   return 'Password must contain at least one lowercase letter';
  // } else if (!RegExp(r'[0-9]').hasMatch(value)) {
  //   return 'Password must contain at least one number';
  // } else if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
  //   return 'Password must contain at least one special character';
  // }
  return null; // Password is valid
}

bool isEmailValid(String email) {
  return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

_isCurrentDialogShowing(BuildContext context) =>
    ModalRoute.of(context)?.isCurrent != true;

dismissDialog(BuildContext context) {
  if (_isCurrentDialogShowing(context)) {
    Navigator.of(context, rootNavigator: true).pop(true);
  }
}


bool isValidUrl(String? url) {
  if(url ==null) {
    return false;
  }
  try {
    final uri = Uri.parse(url);
    return uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https');
  } catch (e) {
    return false;
  }
}