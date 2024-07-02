import 'dart:math';

import 'package:chat_test/constants/constants.dart';
import 'package:chat_test/core/theme/app_text_styles.dart';
import 'package:chat_test/core/theme/colors/app_colors.dart';
import 'package:chat_test/core/utils/app_utils.dart';
import 'package:chat_test/generated/l10n.dart';
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
            child: Text(
              text,
              style: AppTextStyles.deleteText,
            ),
          ),
        ),
      ),
    );
  }

  static String generateUniqueId() {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    final random = Random();

    String generateRandomString(int length, String chars) {
      return String.fromCharCodes(Iterable.generate(
          length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
    }

    String randomLetters = generateRandomString(3, letters);
    String randomNumbers = generateRandomString(4, numbers);

    return randomLetters + randomNumbers;
  }

  static String getError(String error) {
    switch (error) {
      case FirebaseAuthErrors.alreadyExists:
        return AppLocalization.current.email_already_exist;
      case FirebaseAuthErrors.disableUser:
        return AppLocalization.current.user_disabled;
      case FirebaseAuthErrors.invalidError:
        return AppLocalization.current.invalid_email;
      case FirebaseAuthErrors.userNotFound:
        return AppLocalization.current.user_not_found;
      case FirebaseAuthErrors.weakPassword:
        return AppLocalization.current.weak_password;
      case FirebaseAuthErrors.wrongPassword:
        return AppLocalization.current.wrong_password;
      default:
        return AppLocalization.current.input_another_email;
    }
  }

  static String getNameFirstLatter(String name){
    return name.isNotEmpty ? name[0] : "";
  }
}
