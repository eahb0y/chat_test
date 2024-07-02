import 'package:chat_test/core/theme/colors/app_colors.dart';
import 'package:chat_test/core/utils/app_utils.dart';
import 'package:chat_test/generated/l10n.dart';
import 'package:flutter/material.dart';

class SelectImageBottomSheet extends StatelessWidget {
  final Function() onChooseCamera;
  final Function() onChooseGallery;

  const SelectImageBottomSheet({
    super.key,
    required this.onChooseCamera,
    required this.onChooseGallery,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: LightThemeColors.white,
        child: SizedBox(
          height: 150,
          child: Padding(
            padding: AppUtils.kPaddingR20T14L20B23,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onChooseCamera,
                    child: Text(AppLocalization.current.open_camera),
                  ),
                ),
                AppUtils.kBoxWidth10,
                Expanded(
                  child: ElevatedButton(
                    onPressed: onChooseGallery,
                    child: Text(
                      AppLocalization.current.select_from_gallery,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
