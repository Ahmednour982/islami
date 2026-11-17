import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import '../core/theme/app_colors.dart';
import '../services/data_service.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int _playingIndex = -1;
  bool _isPlaying = false;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAudio(String url, int index) async {
    if (_playingIndex == index && _isPlaying) {
      await _audioPlayer.pause();
      setState(() {
        _isPlaying = false;
      });
    } else {
      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(url));
      setState(() {
        _playingIndex = index;
        _isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final qaris = DataService.getQaris();

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          'https://images.unsplash.com/photo-1519817650390-64a93db51149?w=800',
          fit: BoxFit.cover,
        ),
        Container(color: Colors.black.withOpacity(0.9)),
        Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'الراديو',
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
                itemCount: qaris.length,
                itemBuilder: (context, index) {
                  final qari = qaris[index];
                  final isCurrentPlaying = _playingIndex == index && _isPlaying;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isCurrentPlaying
                          ? AppColors.primary.withOpacity(0.2)
                          : AppColors.cardBackground.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isCurrentPlaying
                            ? AppColors.primary
                            : AppColors.border,
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.primary,
                          child: Text(
                            '${qari.id}',
                            style: GoogleFonts.amiri(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                qari.name,
                                style: GoogleFonts.amiri(
                                  fontSize: 20,
                                  color: AppColors.textGold,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                isCurrentPlaying ? 'جاري التشغيل...' : 'اضغط للاستماع',
                                style: GoogleFonts.amiri(
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _playAudio(qari.audioUrl, index),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                            child: Icon(
                              isCurrentPlaying ? Icons.pause : Icons.play_arrow,
                              color: Colors.black,
                              size: 30,
                            ),
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