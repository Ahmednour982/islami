import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_colors.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  // 100 حديث محلي (مختارات من الأحاديث الصحيحة)
  static final List<Map<String, String>> _hadiths = [
    {
      'number': '1',
      'text': 'إنما الأعمال بالنيات، وإنما لكل امرئ ما نوى، فمن كانت هجرته إلى الله ورسوله فهجرته إلى الله ورسوله، ومن كانت هجرته لدنيا يصيبها أو امرأة ينكحها فهجرته إلى ما هاجر إليه.',
      'narrator': 'رواه البخاري ومسلم عن عمر بن الخطاب رضي الله عنه',
    },
    {
      'number': '2',
      'text': 'بني الإسلام على خمس: شهادة أن لا إله إلا الله وأن محمداً رسول الله، وإقام الصلاة، وإيتاء الزكاة، وصوم رمضان، وحج البيت من استطاع إليه سبيلاً.',
      'narrator': 'رواه البخاري ومسلم عن ابن عمر رضي الله عنهما',
    },
    {
      'number': '3',
      'text': 'أن تعبد الله كأنك تراه، فإن لم تكن تراه فإنه يراك.',
      'narrator': 'رواه مسلم عن أبي هريرة رضي الله عنه',
    },
    {
      'number': '4',
      'text': 'من حسن إسلام المرء تركه ما لا يعنيه.',
      'narrator': 'رواه الترمذي عن أبي هريرة رضي الله عنه',
    },
    {
      'number': '5',
      'text': 'لا يؤمن أحدكم حتى يحب لأخيه ما يحب لنفسه.',
      'narrator': 'رواه البخاري ومسلم عن أنس بن مالك رضي الله عنه',
    },
    {
      'number': '6',
      'text': 'من كان يؤمن بالله واليوم الآخر فليقل خيراً أو ليصمت.',
      'narrator': 'رواه البخاري ومسلم عن أبي هريرة رضي الله عنه',
    },
    {
      'number': '7',
      'text': 'الدين النصيحة. قلنا: لمن؟ قال: لله ولكتابه ولرسوله ولأئمة المسلمين وعامتهم.',
      'narrator': 'رواه مسلم عن تميم الداري رضي الله عنه',
    },
    {
      'number': '8',
      'text': 'المسلم من سلم المسلمون من لسانه ويده، والمهاجر من هجر ما نهى الله عنه.',
      'narrator': 'رواه البخاري عن عبد الله بن عمرو رضي الله عنهما',
    },
    {
      'number': '9',
      'text': 'لا ضرر ولا ضرار.',
      'narrator': 'رواه ابن ماجه والدارقطني عن أبي سعيد الخدري رضي الله عنه',
    },
    {
      'number': '10',
      'text': 'اليد العليا خير من اليد السفلى، وابدأ بمن تعول.',
      'narrator': 'رواه البخاري ومسلم عن حكيم بن حزام رضي الله عنه',
    },
    {
      'number': '11',
      'text': 'من سلك طريقاً يلتمس فيه علماً سهل الله له به طريقاً إلى الجنة.',
      'narrator': 'رواه مسلم عن أبي هريرة رضي الله عنه',
    },
    {
      'number': '12',
      'text': 'إن الله لا ينظر إلى صوركم وأموالكم، ولكن ينظر إلى قلوبكم وأعمالكم.',
      'narrator': 'رواه مسلم عن أبي هريرة رضي الله عنه',
    },
    {
      'number': '13',
      'text': 'لا تغضب. (كررها مراراً)',
      'narrator': 'رواه البخاري عن أبي هريرة رضي الله عنه',
    },
    {
      'number': '14',
      'text': 'المؤمن للمؤمن كالبنيان يشد بعضه بعضاً.',
      'narrator': 'رواه البخاري ومسلم عن أبي موسى الأشعري رضي الله عنه',
    },
    {
      'number': '15',
      'text': 'مثل المؤمنين في توادهم وتراحمهم وتعاطفهم مثل الجسد إذا اشتكى منه عضو تداعى له سائر الجسد بالسهر والحمى.',
      'narrator': 'رواه البخاري ومسلم عن النعمان بن بشير رضي الله عنهما',
    },
    {
      'number': '16',
      'text': 'الطهور شطر الإيمان.',
      'narrator': 'رواه مسلم عن أبي مالك الأشعري رضي الله عنه',
    },
    {
      'number': '17',
      'text': 'اتق الله حيثما كنت، وأتبع السيئة الحسنة تمحها، وخالق الناس بخلق حسن.',
      'narrator': 'رواه الترمذي عن أبي ذر الغفاري رضي الله عنه',
    },
    {
      'number': '18',
      'text': 'إنما بعثت لأتمم مكارم الأخلاق.',
      'narrator': 'رواه أحمد والبيهقي عن أبي هريرة رضي الله عنه',
    },
    {
      'number': '19',
      'text': 'الراحمون يرحمهم الرحمن، ارحموا من في الأرض يرحمكم من في السماء.',
      'narrator': 'رواه أبو داود والترمذي عن عبد الله بن عمرو رضي الله عنهما',
    },
    {
      'number': '20',
      'text': 'من لا يرحم لا يُرحم.',
      'narrator': 'رواه البخاري ومسلم عن جرير بن عبد الله رضي الله عنه',
    },
    {
      'number': '21',
      'text': 'ليس الشديد بالصرعة، إنما الشديد الذي يملك نفسه عند الغضب.',
      'narrator': 'رواه البخاري ومسلم عن أبي هريرة رضي الله عنه',
    },
    {
      'number': '22',
      'text': 'المال لا ينقص من الصدقة، وما زاد الله عبداً بعفو إلا عزاً.',
      'narrator': 'رواه مسلم عن أبي هريرة رضي الله عنه',
    },
    {
      'number': '23',
      'text': 'من صام رمضان إيماناً واحتساباً غفر له ما تقدم من ذنبه.',
      'narrator': 'رواه البخاري ومسلم عن أبي هريرة رضي الله عنه',
    },
    {
      'number': '24',
      'text': 'من قام رمضان إيماناً واحتساباً غفر له ما تقدم من ذنبه.',
      'narrator': 'رواه البخاري ومسلم عن أبي هريرة رضي الله عنه',
    },
    {
      'number': '25',
      'text': 'من حج فلم يرفث ولم يفسق رجع من ذنوبه كيوم ولدته أمه.',
      'narrator': 'رواه البخاري ومسلم عن أبي هريرة رضي الله عنه',
    },
    {
      'number': '26',
      'text': 'الصلوات الخمس، والجمعة إلى الجمعة، ورمضان إلى رمضان، مكفرات ما بينهن إذا اجتنبت الكبائر.',
      'narrator': 'رواه مسلم عن أبي هريرة رضي الله عنه',
    },
    {
      'number': '27',
      'text': 'الدين يسر، ولن يشاد الدين أحد إلا غلبه.',
      'narrator': 'رواه البخاري عن أبي هريرة رضي الله عنه',
    },
    {
      'number': '28',
      'text': 'حبب إليّ من دنياكم ثلاث: الطيب، والنساء، وجعلت قرة عيني في الصلاة.',
      'narrator': 'رواه النسائي والحاكم عن أنس بن مالك رضي الله عنه',
    },
    {
      'number': '29',
      'text': 'من توضأ فأحسن الوضوء ثم صلى ركعتين يقبل بقلبه ووجهه عليهما وجبت له الجنة.',
      'narrator': 'رواه مسلم عن عقبة بن عامر رضي الله عنه',
    },
    {
      'number': '30',
      'text': 'ما ملأ آدمي وعاءً شراً من بطنه، بحسب ابن آدم أكلات يقمن صلبه.',
      'narrator': 'رواه الترمذي وابن ماجه عن المقدام بن معد يكرب رضي الله عنه',
    },
    {
      'number': '31',
      'text': 'الدنيا سجن المؤمن، وجنة الكافر.',
      'narrator': 'رواه مسلم عن أبي هريرة رضي الله عنه',
    },
    {
      'number': '32',
      'text': 'إن الله رفيق يحب الرفق في الأمر كله.',
      'narrator': 'رواه البخاري ومسلم عن عائشة رضي الله عنها',
    },
    {
      'number': '33',
      'text': 'من يرد الله به خيراً يفقهه في الدين.',
      'narrator': 'رواه البخاري ومسلم عن معاوية رضي الله عنه',
    },
    {
      'number': '34',
      'text': 'الحياء لا يأتي إلا بخير.',
      'narrator': 'رواه البخاري ومسلم عن عمران بن حصين رضي الله عنه',
    },
    {
      'number': '35',
      'text': 'من كان يؤمن بالله واليوم الآخر فليكرم جاره.',
      'narrator': 'رواه البخاري ومسلم عن أبي هريرة رضي الله عنه',
    },
    {
      'number': '36',
      'text': 'البر حسن الخلق، والإثم ما حاك في صدرك وكرهت أن يطلع عليه الناس.',
      'narrator': 'رواه مسلم عن النواس بن سمعان رضي الله عنه',
    },
    {
      'number': '37',
      'text': 'من غشنا فليس منا.',
      'narrator': 'رواه مسلم عن أبي هريرة رضي الله عنه',
    },
    {
      'number': '38',
      'text': 'المسلم أخو المسلم، لا يظلمه ولا يسلمه.',
      'narrator': 'رواه البخاري ومسلم عن عبد الله بن عمر رضي الله عنهما',
    },
    {
      'number': '39',
      'text': 'إن الله كتب الإحسان على كل شيء.',
      'narrator': 'رواه مسلم عن شداد بن أوس رضي الله عنه',
    },
    {
      'number': '40',
      'text': 'من رأى منكم منكراً فليغيره بيده، فإن لم يستطع فبلسانه، فإن لم يستطع فبقلبه، وذلك أضعف الإيمان.',
      'narrator': 'رواه مسلم عن أبي سعيد الخدري رضي الله عنه',
    },
    {
      'number': '41',
      'text': 'لا حسد إلا في اثنتين: رجل آتاه الله مالاً فسلطه على هلكته في الحق، ورجل آتاه الله الحكمة فهو يقضي بها ويعلمها.',
      'narrator': 'رواه البخاري ومسلم عن عبد الله بن مسعود رضي الله عنه',
    },
    {
      'number': '42',
      'text': 'من سأل الله الشهادة بصدق بلغه الله منازل الشهداء وإن مات على فراشه.',
      'narrator': 'رواه مسلم عن أنس بن مالك رضي الله عنه',
    },
    {
      'number': '43',
      'text': 'الجنة تحت أقدام الأمهات.',
      'narrator': 'رواه النسائي عن معاوية بن جاهمة رضي الله عنه',
    },
    {
      'number': '44',
      'text': 'رضا الرب في رضا الوالد، وسخط الرب في سخط الوالد.',
      'narrator': 'رواه الترمذي والحاكم عن عبد الله بن عمرو رضي الله عنهما',
    },
    {
      'number': '45',
      'text': 'الوالد أوسط أبواب الجنة.',
      'narrator': 'رواه الترمذي وابن ماجه عن عبد الله بن عمر رضي الله عنهما',
    },
    {
      'number': '46',
      'text': 'من أصبح منكم آمناً في سربه، معافى في جسده، عنده قوت يومه، فكأنما حيزت له الدنيا.',
      'narrator': 'رواه الترمذي وابن ماجه عن عبيد الله بن محصن رضي الله عنه',
    },
    {
      'number': '47',
      'text': 'نعمتان مغبون فيهما كثير من الناس: الصحة والفراغ.',
      'narrator': 'رواه البخاري عن ابن عباس رضي الله عنهما',
    },
    {
      'number': '48',
      'text': 'اغتنم خمساً قبل خمس: شبابك قبل هرمك، وصحتك قبل سقمك، وغناك قبل فقرك، وفراغك قبل شغلك، وحياتك قبل موتك.',
      'narrator': 'رواه الحاكم عن ابن عباس رضي الله عنهما',
    },
    {
      'number': '49',
      'text': 'إذا مات ابن آدم انقطع عمله إلا من ثلاث: صدقة جارية، أو علم ينتفع به، أو ولد صالح يدعو له.',
      'narrator': 'رواه مسلم عن أبي هريرة رضي الله عنه',
    },
    {
      'number': '50',
      'text': 'خيركم من تعلم القرآن وعلمه.',
      'narrator': 'رواه البخاري عن عثمان بن عفان رضي الله عنه',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? AppColors.background : Colors.white;
    final cardColor = isDark ? AppColors.cardBackground.withOpacity(0.9) : Colors.grey[100]!;
    final textColor = isDark ? AppColors.text : Colors.black87;
    final secondaryColor = isDark ? AppColors.textSecondary : Colors.black54;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (isDark)
            Image.network(
              'https://images.unsplash.com/photo-1609599006353-e629aaabfeae?w=800',
              fit: BoxFit.cover,
            ),
          if (isDark) Container(color: Colors.black.withOpacity(0.9)),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  'Hadith Collection',
                  style: GoogleFonts.amiri(
                    fontSize: 28,
                    color: isDark ? AppColors.textGold : AppColors.primaryDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _hadiths.length,
                  itemBuilder: (context, index) {
                    final hadith = _hadiths[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: isDark ? AppColors.border : Colors.grey[300]!),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: isDark ? AppColors.primary : AppColors.primaryDark,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Hadith #${hadith['number']}',
                              style: GoogleFonts.amiri(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            hadith['text']!,
                            style: GoogleFonts.amiri(
                              fontSize: 18,
                              color: textColor,
                              height: 1.8,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            hadith['narrator']!,
                            style: GoogleFonts.amiri(
                              fontSize: 14,
                              color: secondaryColor,
                              fontStyle: FontStyle.italic,
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
      ),
    );
  }
}