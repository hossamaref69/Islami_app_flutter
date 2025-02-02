import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/model/quran_data.dart';

class RecentCard extends StatelessWidget {

  final QuranData recentData;
  final Function onClick;

  const RecentCard({super.key, required this.recentData, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.gold, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  recentData.suraNameEn,
                  style: TextStyle(
                    color: AppColors.brown,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  recentData.suraNameAr,
                  style: TextStyle(
                    color: AppColors.brown,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${recentData.suraVerses} Verses",
                  style: TextStyle(
                    color: AppColors.brown,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Image.asset(AppAssets.recentIc)
          ],
        ),
      ),
    );
  }
}
