
import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int index = 0;
  int counter = 0;
  double rotation = 0;
  List<String> tasbehList = [
    "سبحان الله",
    "الحمد الله",
    "لا اله الا الله",
    "الله اكير",
    "لا حول ولا قوة إلا بالله"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.sebhaBg), fit: BoxFit.fill),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.mosqueIslami,
              height: MediaQuery.of(context).size.height * .18,
            ),
            Spacer(),
            const Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "Janna",
              ),
            ),
            Image.asset(
              "assets/icons/top_sebha_icon.png",
              width: MediaQuery.of(context).size.height * 0.15,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: rotation),
                duration: const Duration(milliseconds: 300), // سرعة الدوران
                builder: (context, value, child) {
                  return Transform.rotate(
                    angle: value * (3.141592653589793 / 180), // تحويل الدرجات إلى راديان
                    child: child!,
                  );
                },
                child: Image.asset(
                  "assets/icons/body_sebha_icon.png",
                  width: MediaQuery.of(context).size.height * 0.42,
                ),
              ),
                InkWell(
                  onTap: () {
                    setState(() {
                      counter++;
                      rotation += 180 / 10;
                      if (counter == 10) {
                        counter = 0;
                        index = ((index + 1) % tasbehList.length);
                      }
                    });
                  } ,
                  child: Text(
                    tasbehList[index],
                    style: const TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Janna",
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
