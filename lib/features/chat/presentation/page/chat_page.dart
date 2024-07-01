import 'package:chat_test/core/theme/colors/app_colors.dart';
import 'package:chat_test/core/utils/app_utils.dart';
import 'package:chat_test/features/chat/presentation/arguments/chat_arguments.dart';
import 'package:chat_test/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chat_test/features/chat/presentation/mixin/chat_mixin.dart';
import 'package:chat_test/features/chat/presentation/page/widgets/chat_app_bar.dart';
import 'package:chat_test/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatPage extends StatefulWidget {
  final ChatArguments? arguments;

  const ChatPage({
    super.key,
    required this.arguments,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with ChatMixin {
  @override
  void initState() {
    initController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              ChatAppBar(
                user: widget.arguments?.user ?? "",
              )
            ],
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppUtils.kDivider,
              SafeArea(
                minimum: AppUtils.kPaddingR20T14L20B23,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      child: Ink(
                        padding: AppUtils.kPaddingAll9,
                        decoration: const BoxDecoration(
                          color: LightThemeColors.fieldColor,
                          borderRadius: AppUtils.kBorderRadius12,
                        ),
                        child: SvgPicture.asset("assets/svg/ic_media.svg"),
                      ),
                    ),
                    AppUtils.kBoxWidth8,
                    Expanded(
                      child: SizedBox(
                        height: 42,
                        child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                              hintText: AppLocalization.current.massage),
                        ),
                      ),
                    ),
                    AppUtils.kBoxWidth8,
                    InkWell(
                      child: Ink(
                        padding: AppUtils.kPaddingAll9,
                        decoration: const BoxDecoration(
                          color: LightThemeColors.fieldColor,
                          borderRadius: AppUtils.kBorderRadius12,
                        ),
                        child: const Icon(Icons.send),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    disposeController();
    super.dispose();
  }
}
