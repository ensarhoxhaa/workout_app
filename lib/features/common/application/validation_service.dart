import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_app/core/core.dart';

import 'package:workout_app/features/common/domain/domain.dart';

final validationServiceProvider =
    Provider<ValidationService>((ref) => ValidationService());

class ValidationService {
  ValidationResponse validateEmail(String value, AppLocalizations l10n) {
    if (value.isEmpty) {
      return ValidationResponse(
        type: EmailValidationResponseType.emptyEmail,
        validated: false,
        errorMessage: l10n.emptyEmailMessage,
      );
    } else if (!_emailIsValid(value)) {
      return ValidationResponse(
        type: EmailValidationResponseType.invalidEmail,
        validated: false,
        errorMessage: l10n.invalidEmailMessage,
      );
    } else {
      return ValidationResponse(
        type: EmailValidationResponseType.success,
        validated: true,
      );
    }
  }

  ValidationResponse validatePassword(String value, AppLocalizations l10n) {
    if (value.isEmpty) {
      return ValidationResponse(
        type: PasswordValidationResponseType.emptyPassword,
        validated: false,
        errorMessage: 'Empty',
      );
    } else if (value.length < 8) {
      return ValidationResponse(
        type: PasswordValidationResponseType.passwordLength,
        validated: false,
        errorMessage: 'Password length',
      );
    } else {
      return ValidationResponse(
        type: PasswordValidationResponseType.success,
        validated: true,
      );
    }
  }

  bool _emailIsValid(String value) {
    return RegExp(emailValidationPattern).hasMatch(value);
  }

  static const String emailValidationPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
}
