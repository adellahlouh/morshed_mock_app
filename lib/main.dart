import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:morshed_mock_app/colors.dart';
import 'package:morshed_mock_app/screens/crm_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: localValue,
      builder: (_, local, __) {
        return MaterialApp(
          title: 'Morshed Demo',
          debugShowCheckedModeBanner: false,
          locale: local,
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
            useMaterial3: true,
            fontFamily: AppFonts.kFontFamily,
          ),
          localizationsDelegates: [
            AppLocalizations.delegate, // Add this line
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: const CRMScreen(),
        );
      },
    );
  }
}

final localValue = ValueNotifier<Locale>(const Locale('ar'));
