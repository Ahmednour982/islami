import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_colors.dart';
import '../services/translations.dart';
import 'home_screen.dart';

class IntroScreen extends StatefulWidget {
  final Function(Locale) onLanguageChange;
  final VoidCallback onThemeChange;

  const IntroScreen({
    super.key,
    required this.onLanguageChange,
    required this.onThemeChange,
  });

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _introData = [
    {
      'image': 'https://images.unsplash.com/photo-1584551246679-0daf3d275d0f?w=800',
      'titleKey': 'quran_title',
      'subtitleKey': 'quran_subtitle',
    },
    {
      'image': 'https://images.unsplash.com/photo-1609599006353-e629aaabfeae?w=800',
      'titleKey': 'hadith_title',
      'subtitleKey': 'hadith_subtitle',
    },
    {
      'image': 'https://images.unsplash.com/photo-1519817650390-64a93db51149?w=800',
      'titleKey': 'prayer_title',
      'subtitleKey': 'prayer_subtitle',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            _introData[_currentPage]['image'] as String,
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.75)),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      Text(
                        AppTranslations.translate(_introData[_currentPage]['titleKey'], locale),
                        style: GoogleFonts.amiri(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textGold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppTranslations.translate(_introData[_currentPage]['subtitleKey'], locale),
                        style: GoogleFonts.amiri(
                          fontSize: 20,
                          color: AppColors.text,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _introData.length,
                        (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index ? AppColors.primary : AppColors.textSecondary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage < _introData.length - 1) {
                        setState(() => _currentPage++);
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(
                              onLanguageChange: widget.onLanguageChange,
                              onThemeChange: widget.onThemeChange,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: Text(
                      _currentPage == _introData.length - 1
                          ? AppTranslations.translate('start_now', locale)
                          : AppTranslations.translate('next', locale),
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}