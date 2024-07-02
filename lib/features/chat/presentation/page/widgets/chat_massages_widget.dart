import 'package:chat_test/core/cached_network_image/custom_cached_network_image.dart';
import 'package:chat_test/core/local_source/local_source.dart';
import 'package:chat_test/core/theme/app_text_styles.dart';
import 'package:chat_test/core/theme/colors/app_colors.dart';
import 'package:chat_test/core/utils/app_utils.dart';
import 'package:chat_test/features/chat/domain/entity/conversation_massage_response_entity.dart';
import 'package:chat_test/injection_container.dart';
import 'package:flutter/material.dart';

class ChatMassagesWidget extends StatelessWidget {
  final List<MassageEntity> massages;

  const ChatMassagesWidget({
    super.key,
    required this.massages,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: AppUtils.kPaddingHor20,
      sliver: SliverList.separated(
        itemBuilder: (_, index) => Row(
          mainAxisAlignment: (massages[index].massageSender ==
                  sl<LocalSource>().getUserEmail())
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Ink(
              padding: AppUtils.kPaddingHor10Ver8,
              decoration: BoxDecoration(
                color: (massages[index].massageSender ==
                        sl<LocalSource>().getUserEmail())
                    ? LightThemeColors.chatMassageBg
                    : LightThemeColors.fieldColor,
                borderRadius: AppUtils.kBorderRadius12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  (massages[index]
                              .massage
                              ?.contains("https://firebasestorage") ??
                          false)
                      ? ClipRRect(
                    borderRadius: AppUtils.kBorderRadius12,
                        child: CustomCachedNetworkImage(
                            imageUrl: massages[index].massage ?? "",
                            height: 160,
                          ),
                      )
                      : Text(
                          massages[index].massage ?? "",
                          style: AppTextStyles.chatText.copyWith(
                            color: (massages[index].massageSender ==
                                    sl<LocalSource>().getUserEmail())
                                ? LightThemeColors.chatMassageText
                                : LightThemeColors.appBarTextColor,
                          ),
                        ),
                  AppUtils.kBoxWidth13,
                  Text(
                    massages[index].massageTime ?? "",
                    style: AppTextStyles.chatTextTime.copyWith(
                      color: (massages[index].massageSender ==
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
        itemCount: massages.length,
      ),
    );
  }
}
