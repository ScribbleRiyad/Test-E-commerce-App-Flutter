
import 'package:flutter/material.dart';
import 'package:test_e_commerce/App/Utils/theme_styles.dart';

import '../Widgets/dokan_text_widget.dart';



class Utils {
  static void customSnackBar(
      {required context,
      required String snackText,
      SnackBarBehavior? snackBehavior,
      SnackBarAction? snackBarAction,
      double? snackTextSize,
      Color? snackTextColor,
      int? snackDuration,
      Color? snackBackgroundColor}) {
    final snack = SnackBar(
      backgroundColor: snackBackgroundColor ?? Colors.teal,
      behavior: snackBehavior ?? SnackBarBehavior.fixed,
      elevation: 0,
      dismissDirection: DismissDirection.up,
      action: snackBarAction,
      content: DokanTextWidget(
          color: snackTextColor ?? ThemeStyles.whiteColor,
          fontSize: snackTextSize ?? 14,
          maxLines: 4,
          text: snackText),
      duration: Duration(seconds: snackDuration ?? 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
