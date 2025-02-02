import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/model/quran_data.dart';

class SuraDetails extends StatefulWidget {
  static String routeName = "/sura_details";

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> versesList = [];

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as QuranData;
    loadData(args.id.toString());
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.brown,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            args.suraNameEn,
            style: TextStyle(color: AppColors.gold, fontFamily: "Janna"),
          ),
          iconTheme: IconThemeData(color: AppColors.gold),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppAssets.suraDetailsLeftShape,
                      height: size.height * .10,
                    ),
                    Text(
                      args.suraNameAr,
                      style: TextStyle(
                          fontSize: 24,
                          color: AppColors.gold,
                          fontFamily: "Janna"),
                    ),
                    Image.asset(
                      AppAssets.suraDetailsRightShape,
                      height: size.height * .10,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView.builder(
                        itemBuilder: (context, index) => Text(
                          versesList[index],
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.gold,
                            fontFamily: "Janna",
                          ),
                          textAlign: TextAlign.center,
                        ),
                        itemCount: versesList.length,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(AppAssets.suraDetailsMosque),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  loadData(String suraIndex) async {
    String sura = await rootBundle.loadString("assets/files/surahes/$suraIndex.txt");
    setState(() {
      versesList = sura.split("\n");
    });

  }
}
