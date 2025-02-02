import 'package:flutter/cupertino.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/model/on_boarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel onBoardingModel;

  const OnBoardingItem({super.key, required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          onBoardingModel.imagePath,
          height: size.height * 0.40,
        ),
        Text(
          onBoardingModel.title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: "Janna",
              color: AppColors.gold
          ),
        ),
        Text(
          onBoardingModel.desc??"",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: "Janna",
              color: AppColors.gold
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
