import 'package:flutter/cupertino.dart';
import 'package:islami/core/constants/app_assets.dart';

class TimesTab extends StatefulWidget {
  const TimesTab({super.key});

  @override
  State<TimesTab> createState() => _TimesTabState();
}

class _TimesTabState extends State<TimesTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppAssets.timesBg,
          ),
        fit: BoxFit.fill
        ),
      ),
    );
  }
}
