import '../models/surah.dart';
import '../models/hadith.dart';
import '../models/qari.dart';

class DataService {
  // جلب السور
  static List<Surah> getSurahs() {
    return SurahData.getAllSurahs();
  }

  // جلب الأحاديث
  static List<Hadith> getHadiths() {
    return HadithData.getAllHadiths();
  }

  // جلب القراء
  static List<Qari> getQaris() {
    return QariData.getAllQaris();
  }
}