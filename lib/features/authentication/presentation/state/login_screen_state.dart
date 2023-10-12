import 'package:flutter/cupertino.dart';

class LoginScreenState {
  const LoginScreenState({
    required this.emailController,
    required this.passwordController,
    required this.isLoading,
    required this.showSnackBar,
    required this.snackBarMessage,
    required this.showEmailError,
    required this.emailErrorText,
    required this.showPasswordError,
    required this.passwordErrorText,
  });

  LoginScreenState.initial()
      : emailController = TextEditingController(),
        passwordController = TextEditingController(),
        isLoading = false,
        showSnackBar = false,
        snackBarMessage = '',
        showEmailError = false,
        emailErrorText = '',
        showPasswordError = false,
        passwordErrorText = '';

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;
  final bool showSnackBar;
  final String snackBarMessage;
  final bool showEmailError;
  final String emailErrorText;
  final bool showPasswordError;
  final String passwordErrorText;

  LoginScreenState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isLoading,
    bool? showSnackBar,
    String? snackBarMessage,
    bool? showEmailError,
    String? emailErrorText,
    bool? showPasswordError,
    String? passwordErrorText,
  }) {
    return LoginScreenState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      isLoading: isLoading ?? this.isLoading,
      showSnackBar: showSnackBar ?? this.showSnackBar,
      snackBarMessage: snackBarMessage ?? this.snackBarMessage,
      showEmailError: showEmailError ?? this.showEmailError,
      emailErrorText: emailErrorText ?? this.emailErrorText,
      showPasswordError: showPasswordError ?? this.showPasswordError,
      passwordErrorText: passwordErrorText ?? this.passwordErrorText,
    );
  }
}
