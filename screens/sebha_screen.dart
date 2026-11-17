import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import '../core/theme/app_colors.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int count = 0;
  int currentIndex = 0;

  // 50+ تسبيح
  final List<Map<String, String>> tasbeehList = [
    {'ar': 'سبحان الله', 'en': 'Subhan Allah', 'count': '33'},
    {'ar': 'الحمد لله', 'en': 'Alhamdulillah', 'count': '33'},
    {'ar': 'الله أكبر', 'en': 'Allahu Akbar', 'count': '34'},
    {'ar': 'لا إله إلا الله', 'en': 'La ilaha illa Allah', 'count': '100'},
    {'ar': 'سبحان الله وبحمده', 'en': 'Subhan Allah wa bihamdihi', 'count': '100'},
    {'ar': 'سبحان الله العظيم', 'en': 'Subhan Allah al-Azim', 'count': '100'},
    {'ar': 'لا حول ولا قوة إلا بالله', 'en': 'La hawla wa la quwwata illa billah', 'count': '100'},
    {'ar': 'أستغفر الله', 'en': 'Astaghfirullah', 'count': '100'},
    {'ar': 'اللهم صل على محمد', 'en': 'Allahumma salli ala Muhammad', 'count': '100'},
    {'ar': 'سبحانك اللهم وبحمدك', 'en': 'Subhanaka Allahumma wa bihamdika', 'count': '100'},
    {'ar': 'لا إله إلا أنت سبحانك إني كنت من الظالمين', 'en': 'La ilaha illa anta, subhanaka inni kuntu minaz-zalimin', 'count': '100'},
    {'ar': 'ربنا آتنا في الدنيا حسنة', 'en': 'Rabbana atina fid-dunya hasanah', 'count': '100'},
    {'ar': 'حسبي الله لا إله إلا هو', 'en': 'Hasbiyallahu la ilaha illa huwa', 'count': '100'},
    {'ar': 'اللهم اغفر لي', 'en': 'Allahummaghfir li', 'count': '100'},
    {'ar': 'رب اغفر لي وارحمني', 'en': 'Rabbighfir li warhamni', 'count': '100'},
    {'ar': 'سبحان ذي الملك والملكوت', 'en': 'Subhan dhil-mulk wal-malakut', 'count': '100'},
    {'ar': 'سبحان ذي العزة والجبروت', 'en': 'Subhan dhil-izzati wal-jabarut', 'count': '100'},
    {'ar': 'سبحان الحي الذي لا يموت', 'en': 'Subhan al-Hayyil-ladhi la yamut', 'count': '100'},
    {'ar': 'اللهم أنت السلام', 'en': 'Allahumma antas-salam', 'count': '100'},
    {'ar': 'يا حي يا قيوم', 'en': 'Ya Hayyu Ya Qayyum', 'count': '100'},
    {'ar': 'يا ذا الجلال والإكرام', 'en': 'Ya Dhal-jalali wal-ikram', 'count': '100'},
    {'ar': 'لا إله إلا الله وحده لا شريك له', 'en': 'La ilaha illallahu wahdahu la sharika lahu', 'count': '100'},
    {'ar': 'له الملك وله الحمد', 'en': 'Lahul-mulk wa lahul-hamd', 'count': '100'},
    {'ar': 'وهو على كل شيء قدير', 'en': 'Wa huwa ala kulli shay-in qadir', 'count': '100'},
    {'ar': 'سبحان الله والحمد لله', 'en': 'Subhan Allah wal-hamdulillah', 'count': '100'},
    {'ar': 'ولا إله إلا الله والله أكبر', 'en': 'Wa la ilaha illallah wallahu akbar', 'count': '100'},
    {'ar': 'أستغفر الله العظيم وأتوب إليه', 'en': 'Astaghfirullaha al-Azim wa atubu ilayhi', 'count': '100'},
    {'ar': 'اللهم بارك على محمد', 'en': 'Allahumma barik ala Muhammad', 'count': '100'},
    {'ar': 'ربنا لك الحمد', 'en': 'Rabbana lakal-hamd', 'count': '100'},
    {'ar': 'حمداً كثيراً طيباً مباركاً فيه', 'en': 'Hamdan kathiran tayyiban mubarakan fih', 'count': '100'},
    {'ar': 'سبحان من لا يضره ذنب', 'en': 'Subhan man la yadurruhu dhanb', 'count': '100'},
    {'ar': 'سبحان من لا يعتدي على أهل مملكته', 'en': 'Subhan man la yatadi ala ahli mulkihi', 'count': '100'},
    {'ar': 'سبحان المنفرد بالبقاء', 'en': 'Subhan al-munfarid bil-baqa', 'count': '100'},
    {'ar': 'سبحان الدائم لا يفنى', 'en': 'Subhan ad-da-im la yafna', 'count': '100'},
    {'ar': 'سبحان الحي القيوم', 'en': 'Subhan al-Hayy al-Qayyum', 'count': '100'},
    {'ar': 'سبحان الواحد الأحد', 'en': 'Subhan al-Wahid al-Ahad', 'count': '100'},
    {'ar': 'سبحان الفرد الصمد', 'en': 'Subhan al-Fard as-Samad', 'count': '100'},
    {'ar': 'سبحان من لم يتخذ صاحبة ولا ولداً', 'en': 'Subhan man lam yattakhidh sahibatan wa la walada', 'count': '100'},
    {'ar': 'سبحان من لم يكن له كفواً أحد', 'en': 'Subhan man lam yakun lahu kufuwan ahad', 'count': '100'},
    {'ar': 'سبحان من هو قائم بالقسط', 'en': 'Subhan man huwa qa-im bil-qist', 'count': '100'},
    {'ar': 'سبحان من هو عالم بالغيب', 'en': 'Subhan man huwa alim bil-ghayb', 'count': '100'},
    {'ar': 'سبحان من أحاط بكل شيء علماً', 'en': 'Subhan man ahata bikulli shay-in ilma', 'count': '100'},
    {'ar': 'سبحان من أحصى كل شيء عدداً', 'en': 'Subhan man ahsa kulla shay-in adada', 'count': '100'},
    {'ar': 'سبحان من وسع كل شيء رحمة', 'en': 'Subhan man wasia kulla shay-in rahmah', 'count': '100'},
    {'ar': 'سبحان من لا تخفى عليه خافية', 'en': 'Subhan man la takhfa alayhi khafiyah', 'count': '100'},
    {'ar': 'سبحان من يعلم مثقال الذرة', 'en': 'Subhan man yalimu mithqala dharratin', 'count': '100'},
    {'ar': 'سبحان من يعلم السر وأخفى', 'en': 'Subhan man yalamus-sirra wa akhfa', 'count': '100'},
    {'ar': 'سبحان من بيده ملكوت كل شيء', 'en': 'Subhan man biyadihi malakutu kulli shay', 'count': '100'},
    {'ar': 'سبحان من إليه يرجع الأمر كله', 'en': 'Subhan man ilayhi yurjaul-amru kulluh', 'count': '100'},
    {'ar': 'سبحان من خلق فسوى', 'en': 'Subhan man khalaqa fasawwa', 'count': '100'},
    {'ar': 'سبحان من قدر فهدى', 'en': 'Subhan man qaddara fahada', 'count': '100'},
    {'ar': 'سبحان من أخرج المرعى', 'en': 'Subhan man akhrajal-mar\'a', 'count': '100'},
    {'ar': 'سبحان من جعله غثاء أحوى', 'en': 'Subhan man jaalahu ghutha-an ahwa', 'count': '100'},
  ];

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    final currentTasbeeh = tasbeehList[currentIndex];

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          'https://images.unsplash.com/photo-1542816417-0983c9c9ad53?w=800',
          fit: BoxFit.cover,
        ),
        Container(color: Colors.black.withOpacity(0.85)),
        Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'Tasbeeh',
                style: GoogleFonts.amiri(fontSize: 28, color: AppColors.textGold),
              ),
              centerTitle: true,
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // عرض التسبيح الحالي
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        isArabic ? currentTasbeeh['ar']! : currentTasbeeh['en']!,
                        style: GoogleFonts.amiri(
                          fontSize: 36,
                          color: AppColors.textGold,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Target: ${currentTasbeeh['count']}',
                      style: GoogleFonts.amiri(
                        fontSize: 18,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 40),
                    // زر التسبيح الكبير
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          count++;
                          final target = int.parse(currentTasbeeh['count']!);
                          if (count >= target) {
                            count = 0;
                            currentIndex = (currentIndex + 1) % tasbeehList.length;
                          }
                        });
                        // اهتزاز
                        HapticFeedback.lightImpact();
                      },
                      child: Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.primary, width: 8),
                          color: AppColors.cardBackground.withOpacity(0.8),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.3),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$count',
                                style: GoogleFonts.amiri(
                                  fontSize: 72,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '/ ${currentTasbeeh['count']}',
                                style: GoogleFonts.amiri(
                                  fontSize: 20,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // أزرار التنقل بين التسبيحات
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              currentIndex = (currentIndex - 1 + tasbeehList.length) % tasbeehList.length;
                              count = 0;
                            });
                          },
                          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primary, size: 30),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          '${currentIndex + 1} / ${tasbeehList.length}',
                          style: GoogleFonts.amiri(fontSize: 18, color: AppColors.text),
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              currentIndex = (currentIndex + 1) % tasbeehList.length;
                              count = 0;
                            });
                          },
                          icon: const Icon(Icons.arrow_forward_ios, color: AppColors.primary, size: 30),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          count = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Text(
                        'Reset',
                        style: GoogleFonts.amiri(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}