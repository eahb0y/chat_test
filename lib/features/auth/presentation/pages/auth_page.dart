import 'package:chat_test/core/loading/progress_hud.dart';
import 'package:chat_test/core/theme/app_text_styles.dart';
import 'package:chat_test/core/utils/app_utils.dart';
import 'package:chat_test/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_test/features/auth/presentation/mixin/auth_mixin.dart';
import 'package:chat_test/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with AuthMixin {
  @override
  void initState() {
    initController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: AppUtils.kPaddingL10,
                child: Text(
                  AppLocalization.current.welcome,
                  style: AppTextStyles.appBarTitle,
                ),
              ),
            ),
            body: Padding(
              padding: AppUtils.kPaddingHor16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: AppLocalization.current.email,
                        border: const OutlineInputBorder()),
                    onChanged: (value) {
                      context.read<AuthBloc>().add(EnableSubmitButtonEvent(
                            email: value,
                            password: passwordController.text,
                          ));
                    },
                  ),
                  AppUtils.kBoxHeight10,
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: AppLocalization.current.password,
                        border: const OutlineInputBorder()),
                    onChanged: (value) {
                      context.read<AuthBloc>().add(EnableSubmitButtonEvent(
                            email: emailController.text,
                            password: value,
                          ));
                    },
                  ),
                ],
              ),
            ),
            bottomNavigationBar: SafeArea(
              minimum: AppUtils.kPaddingVer24Hor16.copyWith(
                bottom: MediaQuery.of(context).viewInsets.bottom + 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: state.isEnable
                        ? () {
                            context.read<AuthBloc>().add(LoginEvent(
                                  email: emailController.text,
                        password: passwordController.text,
                      ));
                          }
                        : null,
                    child: Text(AppLocalization.current.log_in),
                  ),
                  AppUtils.kBoxHeight12,
                  ElevatedButton(
                    onPressed: state.isEnable
                        ? () {
                            context.read<AuthBloc>().add(CreateUserEvent(
                                  email: emailController.text,
                            password: passwordController.text,
                          ));
                          }
                        : null,
                    child: Text(AppLocalization.current.register),
                  )
                ],
              ),
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
