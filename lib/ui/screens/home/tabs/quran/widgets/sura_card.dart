import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/model/quran_data.dart';

class SuraCard extends StatelessWidget {
  final int index;
  final QuranData quranData;
  final Function onClick;


  const SuraCard({super.key, required this.index, required this.quranData, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.suraNumberIc),
              ),
            ),
            child: Center(
                child: Text(
              "${index + 1}",
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold),
            )),
          ),
          const SizedBox(
            width: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quranData.suraNameEn,
                style: const TextStyle(
                    color: Colors.white, fontSize: 20, fontFamily: "Janna"),
              ),
              Text(
                "${quranData.suraVerses} Verses",
                style: const TextStyle(
                    color: Colors.white, fontSize: 14, fontFamily: "Janna"),
              ),
            ],
          ),
          const Spacer(),
          Text(
            quranData.suraNameAr,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Janna",
            ),
          ),
        ],
      ),
    );
  }
}
