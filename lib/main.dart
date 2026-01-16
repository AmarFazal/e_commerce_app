import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'services/theme_service.dart';
import 'services/language_service.dart';
import 'services/cart_service.dart';
import 'services/favorite_service.dart';
import 'theme/app_theme.dart';
import 'l10n/app_localizations.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeService()),
        ChangeNotifierProvider(create: (_) => LanguageService()),
        ChangeNotifierProvider(create: (_) => CartService()),
        ChangeNotifierProvider(create: (_) => FavoriteService()),
      ],
      child: Consumer2<ThemeService, LanguageService>(
        builder: (context, themeService, languageService, child) {
          return MaterialApp(
            title: 'ShopEase',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeService.themeMode,
            locale: const Locale('en'),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('tr', ''),
              Locale('en', ''),
            ],
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
