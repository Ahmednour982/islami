import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../core/theme/app_colors.dart';
import 'intro_screen.dart';

class SplashScreen extends StatefulWidget {
  final Function(Locale) onLanguageChange;
  final VoidCallback onThemeChange;

  const SplashScreen({
    super.key,
    required this.onLanguageChange,
    required this.onThemeChange,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => IntroScreen(
                onLanguageChange: widget.onLanguageChange,
                onThemeChange: widget.onThemeChange,
              ),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // خلفية باستخدام CachedNetworkImage
          CachedNetworkImage(
            imageUrl: 'https://images.unsplash.com/photo-1564121211835-e88c859272b7?w=800',
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(color: AppColors.background),
            errorWidget: (context, url, error) => Container(color: AppColors.background),
          ),
          Container(color: Colors.black.withOpacity(0.7)),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: 'https://cdn-icons-png.flaticon.com/512/2884/2884693.png',
                  width: 150,
                  height: 150,
                  placeholder: (context, url) => const CircularProgressIndicator(color: AppColors.primary),
                  errorWidget: (context, url, error) => Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary, width: 3),
                    ),
                    child: const Icon(Icons.auto_awesome, size: 80, color: AppColors.primary),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  'Islami',
                  style: GoogleFonts.amiri(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textGold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}