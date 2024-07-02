import 'package:chat_test/core/theme/app_text_styles.dart';
import 'package:chat_test/core/utils/app_utils.dart';
import 'package:chat_test/generated/l10n.dart';
import 'package:chat_test/router/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 140,
      flexibleSpace: SafeArea(
        minimum: AppUtils.kPaddingR20T14L20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalization.current.chats,
              style: AppTextStyles.appBarTitle,
            ),
            AppUtils.kBoxHeight6,
            TextField(
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.search);
              },
              readOnly: true,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: AppUtils.kPaddingAll8,
                  child: SvgPicture.asset(
                    "assets/svg/ic_search.svg",
                    height: 24,
                  ),
                ),
              ),
            ),
            AppUtils.kBoxHeight24,
          ],
        ),
      ),
      bottom: const PreferredSize(
        preferredSize: Size(
          double.infinity,
          1,
        ),
        child: AppUtils.kDivider,
      ),
    );
  }
}
