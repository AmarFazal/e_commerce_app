import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/theme_service.dart';
import '../../services/language_service.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/animated_card.dart';
import '../../utils/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final themeService = Provider.of<ThemeService>(context);
    final languageService = Provider.of<LanguageService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.settings),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        children: [
          // Theme Settings
          Text(
            'Appearance',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          AnimatedCard(
            onTap: () {
              themeService.toggleTheme();
            },
            child: Row(
              children: [
                Icon(
                  themeService.isDarkMode
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        themeService.isDarkMode
                            ? localizations.lightMode
                            : localizations.darkMode,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Switch between light and dark mode',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: themeService.isDarkMode,
                  onChanged: (value) {
                    themeService.toggleTheme();
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Language Settings
          Text(
            'Language',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          AnimatedCard(
            onTap: () {
              languageService.toggleLanguage();
            },
            child: Row(
              children: [
                Icon(
                  Icons.language,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localizations.language,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        languageService.isTurkish
                            ? localizations.turkish
                            : localizations.english,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Notifications
          Text(
            'Notifications',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          AnimatedCard(
            child: Row(
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Push Notifications',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Switch(
                  value: true,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          AnimatedCard(
            child: Row(
              children: [
                Icon(
                  Icons.email_outlined,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Email Notifications',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Switch(
                  value: true,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // About
          Text(
            'About',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          AnimatedCard(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('App Version'),
                  content: const Text('Version 1.0.0\n\nShopEase E-Commerce App'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'App Version',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  '1.0.0',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          AnimatedCard(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Privacy Policy'),
                  content: const SingleChildScrollView(
                    child: Text(
                      'Privacy Policy\n\n'
                      'We respect your privacy and are committed to protecting your personal data. '
                      'This privacy policy explains how we collect, use, and safeguard your information when you use our app.',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
            child: Row(
              children: [
                Icon(
                  Icons.privacy_tip_outlined,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Privacy Policy',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          AnimatedCard(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Terms of Service'),
                  content: const SingleChildScrollView(
                    child: Text(
                      'Terms of Service\n\n'
                      'By using this app, you agree to our terms of service. '
                      'Please read these terms carefully before using our services.',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
            child: Row(
              children: [
                Icon(
                  Icons.description_outlined,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Terms of Service',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

