import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_colors.dart';
import '../models/surah.dart';
import '../screens/surah_details_screen.dart';

class SurahCard extends StatefulWidget {
  final Surah surah;
  const SurahCard({super.key, required this.surah});

  @override
  State<SurahCard> createState() => _SurahCardState();
}

class _SurahCardState extends State<SurahCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          // رقم السورة (مع Hero Animation)
          GestureDetector(
            onTap: () => _navigateToDetails(context),
            child: Hero(
              tag: 'surah_${widget.surah.id}',
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                child: Center(
                  child: Text(
                    '${widget.surah.id}',
                    style: GoogleFonts.amiri(
                      fontSize: 20,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),

          // معلومات السورة
          Expanded(
            child: GestureDetector(
              onTap: () => _navigateToDetails(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'surah_name_${widget.surah.id}',
                    child: Text(
                      widget.surah.englishName,
                      style: GoogleFonts.amiri(
                        fontSize: 22,
                        color: AppColors.textGold,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${widget.surah.name} • ${widget.surah.versesCount} Verses',
                    style: GoogleFonts.amiri(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // أزرار المفضلة والمشاركة
          Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(_isFavorite ? 'Added to Favorites ❤️' : 'Removed from Favorites'),
                      duration: const Duration(seconds: 1),
                      backgroundColor: AppColors.primary,
                    ),
                  );
                },
                icon: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite ? Colors.red : AppColors.textSecondary,
                  size: 24,
                ),
              ),
              IconButton(
                onPressed: () {
                  // ميزة المشاركة
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Share feature coming soon! 📤'),
                      duration: Duration(seconds: 1),
                      backgroundColor: AppColors.primary,
                    ),
                  );
                },
                icon: const Icon(Icons.share, color: AppColors.textSecondary, size: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _navigateToDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SurahDetailsScreen(surah: widget.surah),
      ),
    );
  }
}