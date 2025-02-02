import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppAssets.radioBg,
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
