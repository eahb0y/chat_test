import 'package:chat_test/core/theme/app_text_styles.dart';
import 'package:chat_test/core/utils/app_utils.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget {
  final String user;

  const ChatAppBar({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      titleSpacing: -4,
      bottom: const PreferredSize(
        preferredSize: Size(double.infinity, 12),
        child: AppUtils.kDivider,
      ),
      title: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: ListTile(
          horizontalTitleGap: 12,
          contentPadding: EdgeInsets.zero,
          leading: const CircleAvatar(
            radius: 48,
          ),
          title: Text(
            user,
            style: AppTextStyles.chatsTitle,
          ),
        ),
      ),
    );
  }
}
