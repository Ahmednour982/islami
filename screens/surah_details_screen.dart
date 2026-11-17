import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../core/theme/app_colors.dart';
import '../models/surah.dart';

class SurahDetailsScreen extends StatefulWidget {
  final Surah surah;
  const SurahDetailsScreen({super.key, required this.surah});

  @override
  State<SurahDetailsScreen> createState() => _SurahDetailsScreenState();
}

class _SurahDetailsScreenState extends State<SurahDetailsScreen> {
  List<Map<String, dynamic>> _ayahs = [];
  bool _isLoading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _loadSurah();
  }

  Future<void> _loadSurah() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.alquran.cloud/v1/surah/${widget.surah.id}'),
      );
      final data = json.decode(response.body);
      final ayahs = data['data']['ayahs'] as List;

      setState(() {
        _ayahs = ayahs.map((a) => {
          'number': a['numberInSurah'],
          'text': a['text'],
        }).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Error loading surah';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1584551246679-0daf3d275d0f?w=800',
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.92)),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  widget.surah.englishName,
                  style: GoogleFonts.amiri(fontSize: 28, color: AppColors.textGold),
                ),
                centerTitle: true,
                iconTheme: const IconThemeData(color: AppColors.primary),
              ),
              // معلومات السورة
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primary.withOpacity(0.3)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildInfoItem('No.', '${widget.surah.id}'),
                    Container(height: 30, width: 1, color: AppColors.primary),
                    _buildInfoItem('Verses', '${widget.surah.versesCount}'),
                    Container(height: 30, width: 1, color: AppColors.primary),
                    _buildInfoItem('Type', widget.surah.revelationTypeEn),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // البسملة
              if (widget.surah.id != 9 && widget.surah.id != 1)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                    style: GoogleFonts.amiri(
                      fontSize: 28,
                      color: AppColors.textGold,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              // عرض الآيات
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
                    : _error.isNotEmpty
                    ? Center(child: Text(_error, style: TextStyle(color: AppColors.text)))
                    : _buildAyahsParagraph(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // بناء نص الآيات المتصل
  Widget _buildAyahsParagraph() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.cardBackground.withOpacity(0.85),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primary.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            // نص الآيات المتصل
            Text.rich(
              TextSpan(
                children: _ayahs.map((ayah) {
                  return TextSpan(
                    children: [
                      TextSpan(
                        text: '${ayah['text']} ',
                        style: GoogleFonts.amiri(
                          fontSize: 24,
                          color: AppColors.text,
                          height: 2.5,
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                          child: Text(
                            '${ayah['number']}',
                            style: GoogleFonts.amiri(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.amiri(
            fontSize: 20,
            color: AppColors.textGold,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.amiri(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}