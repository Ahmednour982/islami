import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_colors.dart';

class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> prayers = [
      {'name': 'الفجر', 'time': '04:30 ص', 'icon': Icons.nightlight_round},
      {'name': 'الشروق', 'time': '06:00 ص', 'icon': Icons.wb_twilight},
      {'name': 'الظهر', 'time': '12:15 م', 'icon': Icons.wb_sunny},
      {'name': 'العصر', 'time': '03:45 م', 'icon': Icons.wb_cloudy},
      {'name': 'المغرب', 'time': '06:20 م', 'icon': Icons.nights_stay},
      {'name': 'العشاء', 'time': '07:50 م', 'icon': Icons.bedtime},
    ];

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          'https://images.unsplash.com/photo-1564121211835-e88c859272b7?w=800',
          fit: BoxFit.cover,
        ),
        Container(color: Colors.black.withOpacity(0.9)),
        Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'مواقيت الصلاة',
                style: GoogleFonts.amiri(
                  fontSize: 28,
                  color: AppColors.textGold,
                ),
              ),
              centerTitle: true,
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: prayers.length,
                itemBuilder: (context, index) {
                  final prayer = prayers[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          prayer['icon'] as IconData,
                          size: 32,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            prayer['name'] as String,
                            style: GoogleFonts.amiri(
                              fontSize: 24,
                              color: AppColors.textGold,
                            ),
                          ),
                        ),
                        Text(
                          prayer['time'] as String,
                          style: GoogleFonts.amiri(
                            fontSize: 20,
                            color: AppColors.text,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
