import 'package:islami/core/constants/app_assets.dart';

class OnBoardingModel {
  String imagePath;
  String title;
  String? desc;

  OnBoardingModel({required this.imagePath, required this.title, this.desc});

  static List<OnBoardingModel> onboardingList = [
    OnBoardingModel(
      imagePath: AppAssets.onBoarding1,
      title: "Welcome To Islmi App",
    ),
    OnBoardingModel(
      imagePath: AppAssets.onBoarding2,
      title: "Welcome To Islami",
      desc: "We Are Very Excited To Have You In Our\n Community"
    ),
    OnBoardingModel(
      imagePath: AppAssets.onBoarding3,
      title: "Reading the Quran",
      desc: "Read, and your Lord is the Most Generous"
    ),
    OnBoardingModel(
      imagePath: AppAssets.onBoarding4,
      title: "Bearish",
      desc: "Praise the name of your Lord, the Most\n High"
    ),
    OnBoardingModel(
      imagePath: AppAssets.onBoarding5,
      title: "Holy Quran Radio",
      desc: "You can listen to the Holy Quran Radio\n through the application for free and easily"
    ),
  ];
}
