import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/constants/app_assets.dart';

import '../../../../../core/constants/hadithTitles.dart';
import '../../../../../core/theme/app_colors.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<String> hadithList = [];
  var controller = PageController();
  var activeIndex = 0;

  // دالة لتحميل الأحاديث من الملفات
  Future<void> loadHadiths() async {
    List<String> allHadiths = [];
    for (int i = 1; i <= 50; i++) {
      try {
        // محاولة تحميل الحديث من الملف المعني
        String hadith = await rootBundle.loadString('assets/files/hadithes/h$i.txt');

        // إذا كانت البيانات غير فارغة
        if (hadith.isNotEmpty) {
          var updateList = hadith.split("\n");  // تقسيم النصوص إذا كان يحتوي على أسطر متعددة
          allHadiths.add(updateList.join("\n"));  // تجميع الأسطر في حديث واحد
        } else {
          print('الحديث رقم $i فارغ');
        }
      } catch (e) {
        print('حدث خطأ أثناء تحميل الحديث رقم $i: $e');
      }
    }
    setState(() {
      hadithList = allHadiths;  // تحديث القائمة
    });
  }
  @override
  void initState() {
    super.initState();
    loadHadiths();  // تحميل الأحاديث عند بدء التطبيق
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AppAssets.hadithBg,
            ),
            fit: BoxFit.fill),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(
              AppAssets.mosqueIslami,
              height: mediaQuery.height * .18,
            ),
            Expanded(
              child: hadithList.isEmpty
                  ? Center(child: CircularProgressIndicator())
               :PageView.builder(
                controller: controller,
                onPageChanged: (index) {
                  activeIndex = index;
                  setState(() {});
                },
                itemCount: hadithList.length,
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: mediaQuery.width * 0.80,
                        height: mediaQuery.height * 0.65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: AppColors.gold,
                        ),
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        width: mediaQuery.width * 0.20,
                                        AppAssets.suraDetailsLeftShape,
                                        color: AppColors.brown,
                                      ),
                                    ),
                                    Text(
                                      HadithTitles.hadithTitles[index],
                                      style: const TextStyle(
                                          fontSize: 22, fontFamily: "Janna"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        width: mediaQuery.width * 0.20,
                                        AppAssets.suraDetailsRightShape,
                                        color: AppColors.brown,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child:  Expanded(
                                      child: SingleChildScrollView(
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          hadithList[index],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Janna",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.3,
                                    child: Image.asset(
                                      AppAssets.onBoarding3,
                                      color: AppColors.brown,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],

        ),
      ),
    );
  }
}