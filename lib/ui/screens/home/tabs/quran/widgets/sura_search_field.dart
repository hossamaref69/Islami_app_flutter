import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/theme/app_colors.dart';

class SuraSearchField extends StatelessWidget {
  const SuraSearchField({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .03),
      child: TextFormField(
        cursorColor: AppColors.gold,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.gold, width: 2),
                borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.gold, width: 2),
                borderRadius: BorderRadius.circular(10.0)),
            hintText: "Sura Name",
            hintStyle: const TextStyle(color: Colors.white, fontFamily: "Janna"),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageIcon(
                AssetImage(
                  AppAssets.quranIc,
                ),
                color: AppColors.gold,
              ),
            ),
        ),
        onChanged: (value) {

        },
        style: TextStyle(color: AppColors.white),
      ),
    );
  }

}
