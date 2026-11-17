class Qari {
  final int id;
  final String name;
  final String nameEn;
  final String audioUrl;

  Qari({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.audioUrl,
  });
}

class QariData {
  static List<Qari> getAllQaris() {
    return [
      Qari(id: 1, name: 'عبد الباسط عبد الصمد', nameEn: 'Abdul Basit Abdul Samad', audioUrl: 'https://server7.mp3quran.net/basit/Almusshaf-Al-Mojawwad/001.mp3'),
      Qari(id: 2, name: 'محمود خليل الحصري', nameEn: 'Mahmoud Khalil Al-Husary', audioUrl: 'https://server13.mp3quran.net/husr/001.mp3'),
      Qari(id: 3, name: 'محمود علي البنا', nameEn: 'Mahmoud Ali Al-Banna', audioUrl: 'https://server6.mp3quran.net/banna/001.mp3'),
      Qari(id: 4, name: 'محمد صديق المنشاوي', nameEn: 'Mohamed Siddiq Al-Minshawi', audioUrl: 'https://server10.mp3quran.net/minsh/Almusshaf-Al-Mojawwad/001.mp3'),
      Qari(id: 5, name: 'أحمد العجمي', nameEn: 'Ahmed Al-Ajmi', audioUrl: 'https://server10.mp3quran.net/ajm/001.mp3'),
      Qari(id: 6, name: 'مشاري العفاسي', nameEn: 'Mishary Al-Afasy', audioUrl: 'https://server8.mp3quran.net/afs/001.mp3'),
      Qari(id: 7, name: 'سعد الغامدي', nameEn: 'Saad Al-Ghamdi', audioUrl: 'https://server7.mp3quran.net/s_gmd/001.mp3'),
      Qari(id: 8, name: 'ماهر المعيقلي', nameEn: 'Maher Al-Muaiqly', audioUrl: 'https://server12.mp3quran.net/maher/001.mp3'),
    ];
  }
}