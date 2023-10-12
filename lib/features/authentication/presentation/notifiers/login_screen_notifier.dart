import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_app/core/core.dart';
import 'package:workout_app/core/navigation/routes.dart';
import 'package:workout_app/features/common/application/validation_service.dart';
import 'package:workout_app/features/features.dart';

final loginScreenNotifierProvider =
    NotifierProvider<LoginScreenNotifier, LoginScreenState>(() {
  return LoginScreenNotifier();
});

class LoginScreenNotifier extends Notifier<LoginScreenState> {
  AuthenticationService get _authenticationService =>
      ref.read(authenticationServiceProvider);

  ValidationService get _validationService =>
      ref.read(validationServiceProvider);

  AppLocalizations get _l10n => ref.read(appLocalizationsProvider);

  @override
  LoginScreenState build() {
    return LoginScreenState.initial();
  }

  Future<void> login() async {
    if (validateFields()) {
      state = state.copyWith(isLoading: true);
      final result = await _authenticationService.login(
        email: state.emailController.text,
        password: state.passwordController.text,
      );
      if (result.isSuccess) {
        ref.read(goRouterProvider).go(AppRoutes.home);
      } else {
        state = state.copyWith(
          snackBarMessage: _l10n.invalidCredentials,
          showSnackBar: true,
        );
      }
      state = state.copyWith(isLoading: false);
    }
  }

  void clearSnackBar() {
    state = state.copyWith(showSnackBar: false, snackBarMessage: '');
  }

  bool validateFields() {
    final emailValidation = _validationService.validateEmail(
      state.emailController.text,
      ref.read(appLocalizationsProvider),
    );
    if (!emailValidation.validated) {
      state = state.copyWith(
        emailErrorText: emailValidation.errorMessage,
        showEmailError: true,
      );
      return false;
    }
    return true;
  }

  void clearEmailError() {
    state = state.copyWith(emailErrorText: '', showEmailError: false);
  }
}
