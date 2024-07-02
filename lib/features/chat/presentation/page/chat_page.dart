import 'package:chat_test/core/functions/base_finctions.dart';
import 'package:chat_test/core/loading/progress_hud.dart';
import 'package:chat_test/core/theme/app_text_styles.dart';
import 'package:chat_test/core/theme/colors/app_colors.dart';
import 'package:chat_test/core/utils/app_utils.dart';
import 'package:chat_test/features/chat/presentation/arguments/chat_arguments.dart';
import 'package:chat_test/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chat_test/features/chat/presentation/mixin/chat_mixin.dart';
import 'package:chat_test/features/chat/presentation/page/widgets/chat_massages_widget.dart';
import 'package:chat_test/features/chat/presentation/page/widgets/select_image_bottom_sheet.dart';
import 'package:chat_test/generated/l10n.dart';
import 'package:chat_test/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

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
    _streamCall();
    super.initState();
  }

  void _streamCall() {
    var broadcastStream = stream.stream.asBroadcastStream();
    broadcastStream.listen(
      (value) {
        context.read<ChatBloc>().add(GetConversationCallEvent(
            conversation: sl<ChatBloc>().state.chatId ?? ""));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            toolbarHeight: 50,
            centerTitle: false,
            bottom: const PreferredSize(
              preferredSize: Size(double.infinity, 12),
              child: AppUtils.kDivider,
            ),
            title: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  child: Text(Functions.getNameFirstLatter(
                      widget.arguments?.user ?? "")),
                ),
                AppUtils.kBoxWidth12,
                Text(
                  widget.arguments?.user ?? "",
                  style: AppTextStyles.chatsTitle,
                ),
              ],
            ),
          ),
          body: ModalProgressHUD(
            inAsyncCall: state.isLoading,
            child: CustomScrollView(
              slivers: [
                AppUtils.kGap10,
                ChatMassagesWidget(
                  massages:
                      state.conversationMassageResponseEntity?.toList() ?? [],
                ),
                AppUtils.kGap10
              ],
            ),
          ),
          bottomNavigationBar: ColoredBox(
            color: LightThemeColors.white,
            child: Column(
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
                        child: Container(
                          padding: AppUtils.kPaddingAll9,
                          decoration: const BoxDecoration(
                            color: LightThemeColors.fieldColor,
                            borderRadius: AppUtils.kBorderRadius12,
                          ),
                          child: SvgPicture.asset("assets/svg/ic_media.svg"),
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (_) => SelectImageBottomSheet(
                                    onChooseCamera: () {
                                      ImagePicker()
                                          .pickImage(
                                              source: ImageSource.camera,
                                              preferredCameraDevice:
                                                  CameraDevice.front)
                                          .then((value) {
                                        context.read<ChatBloc>().add(
                                            UploadImageEvent(image: value));
                                        Navigator.pop(context);
                                          });
                                    },
                                    onChooseGallery: () {
                                      ImagePicker()
                                          .pickImage(
                                              source: ImageSource.gallery)
                                          .then((value) {
                                        context.read<ChatBloc>().add(
                                            UploadImageEvent(image: value));
                                        Navigator.pop(context);
                                      });
                                    },
                                  ));
                        },
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
                        child: Container(
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
