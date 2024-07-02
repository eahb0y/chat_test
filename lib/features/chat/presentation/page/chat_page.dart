import 'package:chat_test/core/loading/progress_hud.dart';
import 'package:chat_test/core/local_source/local_source.dart';
import 'package:chat_test/core/theme/app_text_styles.dart';
import 'package:chat_test/core/theme/colors/app_colors.dart';
import 'package:chat_test/core/utils/app_utils.dart';
import 'package:chat_test/features/chat/presentation/arguments/chat_arguments.dart';
import 'package:chat_test/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chat_test/features/chat/presentation/mixin/chat_mixin.dart';
import 'package:chat_test/generated/l10n.dart';
import 'package:chat_test/injection_container.dart';
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
    context
        .read<ChatBloc>()
        .add(InitialCallEvent(user: widget.arguments?.user ?? ""));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: -4,
            bottom: const PreferredSize(
              preferredSize: Size(double.infinity, 12),
              child: AppUtils.kDivider,
            ),
            title: PreferredSize(
              preferredSize: const Size(double.infinity, 50),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const CircleAvatar(
                  radius: 24,
                ),
                title: Text(
                  widget.arguments?.user ?? "",
                  style: AppTextStyles.chatsTitle,
                ),
              ),
            ),
          ),
          body: ModalProgressHUD(
            inAsyncCall: state.isLoading,
            child: CustomScrollView(
              // reverse: true,
              slivers: [
                AppUtils.kGap10,
                SliverPadding(
                  padding: AppUtils.kPaddingHor20,
                  sliver: SliverList.separated(
                    itemBuilder: (_, index) => Row(
                      mainAxisAlignment: (state
                                  .conversationMassageResponseEntity
                                  ?.toList()[index]
                                  .massageSender ==
                              sl<LocalSource>().getUserEmail())
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Ink(
                          padding: AppUtils.kPaddingHor10Ver8,
                          decoration: BoxDecoration(
                            color: (state.conversationMassageResponseEntity
                                        ?.toList()[index]
                                        .massageSender ==
                                    sl<LocalSource>().getUserEmail())
                                ? LightThemeColors.chatMassageBg
                                : LightThemeColors.fieldColor,
                            borderRadius: AppUtils.kBorderRadius12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.conversationMassageResponseEntity
                                        ?.toList()[index]
                                        .massage ??
                                    "",
                                style: AppTextStyles.chatText.copyWith(
                                  color: (state
                                              .conversationMassageResponseEntity
                                              ?.toList()[index]
                                              .massageSender ==
                                          sl<LocalSource>().getUserEmail())
                                      ? LightThemeColors.chatMassageText
                                      : LightThemeColors.appBarTextColor,
                                ),
                              ),
                              AppUtils.kBoxWidth13,
                              Text(
                                state.conversationMassageResponseEntity
                                        ?.toList()[index]
                                        .massageTime ??
                                    "",
                                style: AppTextStyles.chatTextTime.copyWith(
                                  color: (state
                                              .conversationMassageResponseEntity
                                              ?.toList()[index]
                                              .massageSender ==
                                          sl<LocalSource>().getUserEmail())
                                      ? LightThemeColors.chatMassageText
                                      : LightThemeColors.appBarTextColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    separatorBuilder: (_, __) => AppUtils.kBoxHeight6,
                    itemCount:
                        state.conversationMassageResponseEntity?.length ?? 0,
                  ),
                ),
                AppUtils.kGap10
              ],
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppUtils.kDivider,
              SafeArea(
                minimum: AppUtils.kPaddingR20T14L20B23.copyWith(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 23,
                ),
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
                      onTap: () {
                        context.read<ChatBloc>().add(SendMassageCallEvent(
                              massage: controller.text,
                              conversationId: state.chatId,
                            ));
                        controller.clear();
                      },
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
