import 'package:chat_test/core/functions/base_finctions.dart';
import 'package:chat_test/core/loading/progress_hud.dart';
import 'package:chat_test/core/theme/app_text_styles.dart';
import 'package:chat_test/core/utils/app_utils.dart';
import 'package:chat_test/features/chat/presentation/arguments/chat_arguments.dart';
import 'package:chat_test/features/search/presentation/bloc/search_bloc.dart';
import 'package:chat_test/features/search/presentation/page/widgets/search_app_bar_widget.dart';
import 'package:chat_test/router/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: state.isLoading,
            child: CustomScrollView(
              slivers: [
                const SearchAppBarWidget(),
                SliverList.separated(
                  itemBuilder: (_, index) => ListTile(
                    contentPadding: AppUtils.kPaddingHor0Ver10,
                    minLeadingWidth: 10,
                    minVerticalPadding: 0,
                    horizontalTitleGap: -4,
                    leading: CircleAvatar(
                      radius: 50,
                      child: Text(Functions.getNameFirstLatter(
                          state.userList?.toList()[index] ?? "")),
                    ),
                    title: Text(
                      state.userList?.toList()[index] ?? "",
                      style: AppTextStyles.chatsTitle,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.chat,
                          arguments: ChatArguments(
                            user: state.userList?.toList()[index] ?? "",
                          ));
                    },
                  ),
                  separatorBuilder: (_, __) => AppUtils.kDividerPad20,
                  itemCount: state.userList?.length ?? 0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
