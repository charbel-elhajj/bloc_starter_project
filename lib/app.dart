import 'package:bloc_starter_project/core/style/theme.dart';
import 'package:bloc_starter_project/features/counter/presentation/views/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key, this.home});

  @visibleForTesting
  final Widget? home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Starter Project',
      debugShowCheckedModeBanner: false,
      theme: theme,
      locale: const Locale('en'),
      localizationsDelegates: _retrieveLocalizationDelegates(context),
      supportedLocales: const [Locale('en')],
      home: home ?? const CounterView(),
    );
  }

  List<LocalizationsDelegate> _retrieveLocalizationDelegates(BuildContext context) {
    final customLocalizationDelegate = FlutterI18nDelegate(
      translationLoader: FileTranslationLoader(
        basePath: 'assets/translations',
        forcedLocale: const Locale('fr'),
      ),
    );

    return [
      customLocalizationDelegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ];
  }
}
