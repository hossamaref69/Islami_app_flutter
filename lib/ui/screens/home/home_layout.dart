import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/ui/screens/home/tabs/hadith/hadith_tab.dart';
import 'package:islami/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:islami/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami/ui/screens/home/tabs/times/times_tab.dart';


class HomeLayout extends StatefulWidget {
  static String routeName = "/home";

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    const QuranTab(),
    const HadithTab(),
    const SebhaTab(),
    const RadioTab(),
    const TimesTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.gold,
        fixedColor: AppColors.white,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: (index){
          selectedIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AppAssets.quranIc),
              ),
              label: "Quran",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(AppAssets.hadithIc),
            ),
            label: "Hadith",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(AppAssets.sebhaIc),
            ),
            label: "Sebha",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(AppAssets.radioIc),
            ),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(AppAssets.timesIc),
            ),
            label: "Times",
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
