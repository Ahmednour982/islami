import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_colors.dart';
import '../services/translations.dart';
import 'quran_screen.dart';
import 'hadith_screen.dart';
import 'sebha_screen.dart';
import 'radio_screen.dart';
import 'prayer_times_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function(Locale) onLanguageChange;
  final VoidCallback onThemeChange;

  const HomeScreen({
    super.key,
    required this.onLanguageChange,
    required this.onThemeChange,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: _buildCurrentScreen(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
          selectedLabelStyle: GoogleFonts.amiri(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: GoogleFonts.amiri(fontSize: 12),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              activeIcon: const Icon(Icons.home),
              label: AppTranslations.translate('home', locale),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.menu_book_outlined),
              activeIcon: const Icon(Icons.menu_book),
              label: AppTranslations.translate('quran', locale),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.library_books_outlined),
              activeIcon: const Icon(Icons.library_books),
              label: AppTranslations.translate('hadith', locale),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.circle_outlined),
              activeIcon: const Icon(Icons.circle),
              label: AppTranslations.translate('sebha', locale),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.access_time_outlined),
              activeIcon: const Icon(Icons.access_time),
              label: AppTranslations.translate('prayer_times', locale),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentScreen() {
    switch (_currentIndex) {
      case 0:
        return HomeBody(
          onLanguageChange: widget.onLanguageChange,
          onThemeChange: widget.onThemeChange,
        );
      case 1:
        return const QuranScreen();
      case 2:
        return const HadithScreen();
      case 3:
        return const SebhaScreen();
      case 4:
        return const PrayerTimesScreen();
      default:
        return const HomeBody(
          onLanguageChange: _dummyLanguageChange,
          onThemeChange: _dummyThemeChange,
        );
    }
  }

  static void _dummyLanguageChange(Locale locale) {}
  static void _dummyThemeChange() {}
}

class HomeBody extends StatelessWidget {
  final Function(Locale) onLanguageChange;
  final VoidCallback onThemeChange;

  const HomeBody({
    super.key,
    required this.onLanguageChange,
    required this.onThemeChange,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          'https://images.unsplash.com/photo-1564121211835-e88c859272b7?w=800',
          fit: BoxFit.cover,
        ),
        Container(color: Colors.black.withOpacity(0.85)),
        SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppTranslations.translate('welcome', locale),
                          style: GoogleFonts.amiri(
                            fontSize: 28,
                            color: AppColors.text,
                          ),
                        ),
                        Text(
                          AppTranslations.translate(
                            'welcome_subtitle',
                            locale,
                          ),
                          style: GoogleFonts.amiri(
                            fontSize: 20,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: onThemeChange,
                        icon: Icon(
                          isDark ? Icons.light_mode : Icons.dark_mode,
                          color: AppColors.primary,
                          size: 32,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          final newLocale = locale.languageCode == 'ar'
                              ? const Locale('en', 'US')
                              : const Locale('ar', 'EG');
                          onLanguageChange(newLocale);
                        },
                        icon: const Icon(
                          Icons.language,
                          color: AppColors.primary,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.1,
                children: [
                  _buildFeatureCard(
                    context,
                    AppTranslations.translate('quran', locale),
                    Icons.menu_book,
                    1,
                  ),
                  _buildFeatureCard(
                    context,
                    AppTranslations.translate('hadith', locale),
                    Icons.library_books,
                    2,
                  ),
                  _buildFeatureCard(
                    context,
                    AppTranslations.translate('sebha', locale),
                    Icons.circle,
                    3,
                  ),
                  _buildFeatureCard(
                    context,
                    AppTranslations.translate('prayer_times', locale),
                    Icons.access_time,
                    4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureCard(
      BuildContext context,
      String title,
      IconData icon,
      int index,
      ) {
    return GestureDetector(
      onTap: () {
        final homeState = context.findAncestorStateOfType<_HomeScreenState>();
        if (homeState != null) {
          homeState.setState(() => homeState._currentIndex = index);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: AppColors.primary),
            const SizedBox(height: 12),
            Text(
              title,
              style: GoogleFonts.amiri(
                fontSize: 20,
                color: AppColors.textGold,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}