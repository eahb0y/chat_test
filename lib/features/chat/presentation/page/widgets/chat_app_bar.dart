import 'package:chat_test/core/theme/app_text_styles.dart';
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
      backgroundColor: Colors.blue,
      titleSpacing: 0,

      title: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
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
