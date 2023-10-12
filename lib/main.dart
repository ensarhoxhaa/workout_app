import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_app/core/localization/localization.dart';
import 'package:workout_app/core/navigation/routes.dart';
import 'package:workout_app/core/theme/app_themes.dart';
import 'package:workout_app/core/theme/theme_notifier.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Workout App',
      theme: ref.watch(themeModeProvider) ? lightThemeData : darkThemeData,
      routeInformationProvider:
          ref.read(goRouterProvider).routeInformationProvider,
      routeInformationParser: ref.read(goRouterProvider).routeInformationParser,
      routerDelegate: ref.read(goRouterProvider).routerDelegate,
    );
  }
}
