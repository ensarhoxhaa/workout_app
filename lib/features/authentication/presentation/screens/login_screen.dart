import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_app/core/core.dart';
import 'package:workout_app/features/common/common.dart';
import 'package:workout_app/features/features.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      loginScreenNotifierProvider,
      (previous, next) {
        if (next.showSnackBar) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackBar(
              message: next.snackBarMessage,
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          );
          ref.read(loginScreenNotifierProvider.notifier).clearSnackBar();
        }
      },
    );
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              context.focusScope.unfocus();
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.images.loginScreenBackground),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 390,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: context.colors.secondaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.l10n.welcomeToTimeInk,
                    style: context.textStyles.headlineMedium,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    context.l10n.email,
                    style: context.textStyles.bodySmall,
                  ),
                  CustomTextField(
                    controller:
                        ref.read(loginScreenNotifierProvider).emailController,
                    prefixIcon: Assets.fromSvg(
                      svgPath: Assets.icons.emailIcon,
                      fit: BoxFit.scaleDown,
                    ),
                    onChanged: (value) {
                      ref
                          .read(loginScreenNotifierProvider.notifier)
                          .clearEmailError();
                    },
                    hintText: AppStrings.emailHint,
                    textInputAction: TextInputAction.next,
                    errorText: ref
                            .watch(loginScreenNotifierProvider)
                            .showEmailError
                        ? ref.read(loginScreenNotifierProvider).emailErrorText
                        : null,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    context.l10n.password,
                    style: context.textStyles.bodySmall,
                  ),
                  CustomTextField(
                    controller: ref
                        .read(loginScreenNotifierProvider)
                        .passwordController,
                    prefixIcon: Assets.fromSvg(
                      svgPath: Assets.icons.lockIcon,
                      fit: BoxFit.scaleDown,
                    ),
                    hintText: AppStrings.passwordHint,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomButton(
                    title: context.l10n.enter,
                    onTap: ref.read(loginScreenNotifierProvider.notifier).login,
                    isEnabled: true,
                  ),
                ],
              ),
            ),
          ),
          if (ref.watch(loginScreenNotifierProvider).isLoading)
            Container(
              color: Colors.white.withOpacity(0.95),
              height: double.infinity,
              width: double.infinity,
              child: const Center(
                child: SizedBox(
                  height: 180,
                  width: 180,
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                    strokeWidth: 18,
                  ),
                ),
              ),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
