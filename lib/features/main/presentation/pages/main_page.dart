import 'package:chat_test/core/functions/base_finctions.dart';
import 'package:chat_test/core/loading/progress_hud.dart';
import 'package:chat_test/core/theme/app_text_styles.dart';
import 'package:chat_test/core/utils/app_utils.dart';
import 'package:chat_test/features/chat/presentation/arguments/chat_arguments.dart';
import 'package:chat_test/features/main/presentation/bloc/main_bloc.dart';
import 'package:chat_test/features/main/presentation/mixin/main_mixin.dart';
import 'package:chat_test/features/main/presentation/pages/widget/main_app_bar.dart';
import 'package:chat_test/router/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with MainMixin {
  @override
  void initState() {
    initController();
    super.initState();
    _streamCall();
  }

  void _streamCall() {
    var broadcastStream = streamController.stream.asBroadcastStream();
    broadcastStream.listen(
      (value) {
        context.read<MainBloc>().add(const OnStreamCallEvent());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: state.isLoading,
            child: CustomScrollView(
              slivers: [
                const MainAppBar(),
                SliverList.separated(
                  itemBuilder: (_, index) => ListTile(
                    contentPadding: AppUtils.kPaddingHor0Ver10,
                    minLeadingWidth: 10,
                    minVerticalPadding: 0,
                    horizontalTitleGap: -4,
                    leading: CircleAvatar(
                      radius: 50,
                      child: Text(Functions.getNameFirstLatter(state
                              .massagesList?.setOfChats
                              ?.toList()[index]
                              .recipient ??
                          "")),
                    ),
                    title: Text(
                      state.massagesList?.setOfChats
                              ?.toList()[index]
                              .recipient ??
                          "",
                      style: AppTextStyles.chatsTitle,
                    ),
                    // subtitle: Text(Functions.onlineUser(state
                    //         .massagesList?.setOfChats
                    //         ?.toList()[index]
                    //         .recipient ??
                    //     "")),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.chat,
                          arguments: ChatArguments(
                            user: state.massagesList?.setOfChats
                                    ?.toList()[index]
                                    .recipient ??
                                "",
                          ));
                    },
                  ),
                  separatorBuilder: (_, __) => AppUtils.kDividerPad20,
                  itemCount: state.massagesList?.setOfChats?.length ?? 0,
                ),
              ],
            ),
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
