import 'package:chat_test/core/theme/app_text_styles.dart';
import 'package:chat_test/core/theme/colors/app_colors.dart';
import 'package:chat_test/core/utils/app_utils.dart';
import 'package:chat_test/router/app_routes.dart';
import 'package:flutter/material.dart';

class Functions {
  static void showAlertSnackBar(String text) {
    ScaffoldMessenger.of(rootNavigatorKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.zero,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        content: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: AppUtils.kBorderRadius24,
          ),
          color: LightThemeColors.snackBarColor,
          child: Padding(
            padding: AppUtils.kPaddingVer10Hor16,
            child: Row(
              children: [
                const Image(
                  image: AssetImage("assets/png/ic_logo_small.png"),
                  height: 24,
                  width: 24,
                ),
                AppUtils.kBoxWidth8,
                Expanded(
                  child: Text(
                    text,
                    style: AppTextStyles.deleteText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
