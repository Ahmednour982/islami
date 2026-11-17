import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_colors.dart';
import '../models/surah.dart';
import '../services/translations.dart';
import '../widgets/surah_card.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Surah> _allSurahs = [];
  List<Surah> _filteredSurahs = [];

  @override
  void initState() {
    super.initState();
    _allSurahs = SurahData.getAllSurahs();
    _filteredSurahs = _allSurahs;
  }

  void _filterSurahs(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredSurahs = _allSurahs;
      } else {
        _filteredSurahs = _allSurahs.where((surah) {
          return surah.name.contains(query) ||
              surah.englishName.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          'https://images.unsplash.com/photo-1584551246679-0daf3d275d0f?w=800',
          fit: BoxFit.cover,
        ),
        Container(color: Colors.black.withOpacity(0.9)),
        Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'Holy Quran',
                style: GoogleFonts.amiri(fontSize: 28, color: AppColors.textGold),
              ),
              centerTitle: true,
            ),
            // شريط البحث
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                controller: _searchController,
                onChanged: _filterSurahs,
                style: const TextStyle(color: AppColors.text),
                decoration: InputDecoration(
                  hintText: 'Search Surah (Arabic or English)...',
                  hintStyle: TextStyle(color: AppColors.textSecondary),
                  prefixIcon: const Icon(Icons.search, color: AppColors.primary),
                  filled: true,
                  fillColor: AppColors.cardBackground.withOpacity(0.8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: _filteredSurahs.isEmpty
                  ? Center(
                child: Text(
                  'No Surah found',
                  style: GoogleFonts.amiri(fontSize: 20, color: AppColors.textSecondary),
                ),
              )
                  : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _filteredSurahs.length,
                itemBuilder: (context, index) {
                  return SurahCard(surah: _filteredSurahs[index]);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}