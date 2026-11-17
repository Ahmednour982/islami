import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_colors.dart';
import '../models/hadith.dart';

class HadithCard extends StatelessWidget {
  final Hadith hadith;
  const HadithCard({super.key, required this.hadith});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hadith.title, style: GoogleFonts.amiri(fontSize: 24, color: AppColors.textGold, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text(hadith.content, style: GoogleFonts.amiri(fontSize: 18, color: AppColors.text, height: 1.8)),
          const SizedBox(height: 16),
          Text(hadith.narrator, style: GoogleFonts.amiri(fontSize: 14, color: AppColors.textSecondary, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}