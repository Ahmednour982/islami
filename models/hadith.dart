class Hadith {
  final int id;
  final String title;
  final String titleEn;
  final String content;
  final String contentEn;
  final String narrator;
  final String narratorEn;

  Hadith({
    required this.id,
    required this.title,
    required this.titleEn,
    required this.content,
    required this.contentEn,
    required this.narrator,
    required this.narratorEn,
  });
}

class HadithData {
  static List<Hadith> getAllHadiths() {
    return [
      Hadith(
        id: 1,
        title: 'حديث النية',
        titleEn: 'Hadith of Intention',
        content: 'إنما الأعمال بالنيات، وإنما لكل امرئ ما نوى، فمن كانت هجرته إلى الله ورسوله فهجرته إلى الله ورسوله، ومن كانت هجرته لدنيا يصيبها أو امرأة ينكحها فهجرته إلى ما هاجر إليه',
        contentEn: 'Actions are judged by intentions, and each person will get what they intended. So whoever emigrated for Allah and His Messenger, their emigration was for Allah and His Messenger.',
        narrator: 'رواه البخاري ومسلم عن عمر بن الخطاب رضي الله عنه',
        narratorEn: 'Narrated by Al-Bukhari and Muslim from Umar ibn Al-Khattab (RA)',
      ),
      Hadith(
        id: 2,
        title: 'حديث أركان الإسلام',
        titleEn: 'Hadith of Pillars of Islam',
        content: 'بني الإسلام على خمس: شهادة أن لا إله إلا الله وأن محمداً رسول الله، وإقام الصلاة، وإيتاء الزكاة، وصوم رمضان، وحج البيت من استطاع إليه سبيلاً',
        contentEn: 'Islam is built on five pillars: testifying that there is no god but Allah and that Muhammad is the Messenger of Allah, establishing prayer, paying zakat, fasting Ramadan, and performing Hajj.',
        narrator: 'رواه البخاري ومسلم عن ابن عمر رضي الله عنهما',
        narratorEn: 'Narrated by Al-Bukhari and Muslim from Ibn Umar (RA)',
      ),
      Hadith(
        id: 3,
        title: 'حديث الإحسان',
        titleEn: 'Hadith of Ihsan',
        content: 'أن تعبد الله كأنك تراه، فإن لم تكن تراه فإنه يراك',
        contentEn: 'To worship Allah as if you see Him, for even if you do not see Him, He sees you.',
        narrator: 'رواه مسلم عن أبي هريرة رضي الله عنه',
        narratorEn: 'Narrated by Muslim from Abu Hurairah (RA)',
      ),
      Hadith(
        id: 4,
        title: 'حديث من حسن إسلام المرء',
        titleEn: 'Hadith of Good Islam',
        content: 'من حسن إسلام المرء تركه ما لا يعنيه',
        contentEn: 'Part of the perfection of one\'s Islam is leaving that which does not concern him.',
        narrator: 'رواه الترمذي عن أبي هريرة رضي الله عنه',
        narratorEn: 'Narrated by At-Tirmidhi from Abu Hurairah (RA)',
      ),
      Hadith(
        id: 5,
        title: 'حديث لا يؤمن أحدكم',
        titleEn: 'Hadith of Faith',
        content: 'لا يؤمن أحدكم حتى يحب لأخيه ما يحب لنفسه',
        contentEn: 'None of you truly believes until he loves for his brother what he loves for himself.',
        narrator: 'رواه البخاري ومسلم عن أنس بن مالك رضي الله عنه',
        narratorEn: 'Narrated by Al-Bukhari and Muslim from Anas ibn Malik (RA)',
      ),
    ];
  }
}