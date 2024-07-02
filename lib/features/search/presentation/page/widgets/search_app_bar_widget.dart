import 'package:chat_test/core/functions/debouncer.dart';
import 'package:chat_test/core/theme/app_text_styles.dart';
import 'package:chat_test/core/utils/app_utils.dart';
import 'package:chat_test/features/search/presentation/bloc/search_bloc.dart';
import 'package:chat_test/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchAppBarWidget extends StatelessWidget {
  const SearchAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      expandedHeight: 140,
      title: Text(
        AppLocalization.current.search,
        style: AppTextStyles.appBarTitle,
      ),
      bottom: PreferredSize(
        preferredSize: const Size(
          double.infinity,
          1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppUtils.kPaddingHor20,
              child: TextField(
                onChanged: (value) {
                  Debouncer.run(() {
                    context
                        .read<SearchBloc>()
                        .add(SearchUserEvent(user: value));
                  });
                },
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
            ),
            AppUtils.kBoxHeight24,
            AppUtils.kDivider
          ],
        ),
      ),
    );
  }
}
