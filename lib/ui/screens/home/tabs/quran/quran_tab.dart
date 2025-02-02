
import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/constants/local_storage_keys.dart';
import 'package:islami/core/constants/surahes.dart';
import 'package:islami/core/service/local_storage_service.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/model/quran_data.dart';
import 'package:islami/ui/screens/home/tabs/quran/widgets/recent_card.dart';
import 'package:islami/ui/screens/home/tabs/quran/widgets/sura_card.dart';

import '../../../soura_details/sura_details.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadRecentSurah();
    });
  }

  String searchQuery = "";
  List<QuranData> recentSurahModels = [];
  List<QuranData> searchSurahModels = [];
  List<String> recentSurahIndexes = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AppAssets.quranBg,
            ),
            fit: BoxFit.fill),
      ),
      child: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Image.asset(
                AppAssets.mosqueIslami,
                height: size.height * .18,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery
                        .of(context)
                        .size
                        .width * .03),
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
                    hintStyle:
                    const TextStyle(color: Colors.white, fontFamily: "Janna"),
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
                    setState(() {
                      searchQuery = value;
                      search();
                      if (value.isEmpty) {
                        FocusScope.of(context).unfocus();
                      }
                    });
                  },
                  style: TextStyle(color: AppColors.white),
                ),
              ),
              Expanded(
                child: Visibility(
                  replacement: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.separated(
                        itemCount: searchSurahModels.length,
                        itemBuilder: (context, index) =>
                            SuraCard(
                              onClick: () {
                                _onSuraTap(searchSurahModels[index].id-1, context);
                              },
                              index: index,
                              quranData: searchSurahModels[index],
                            ),
                        separatorBuilder: (context, index) => const Divider(),
                      ),
                    ),
                  ),
                  visible: searchQuery.isEmpty,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20,
                        ),
                        child: Text(
                          "Most Recently",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Janna",
                            color: AppColors.lightGold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery
                                .of(context)
                                .size
                                .width * .03),
                        child: SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .20,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: recentSurahModels.length,
                            itemBuilder: (context, index) =>
                                RecentCard(
                                  onClick: () {
                                    Navigator.pushNamed(
                                      context,
                                      SuraDetails.routeName,
                                      arguments: recentSurahModels[index],
                                    );
                                  },
                                  recentData: recentSurahModels[index],
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        child: Text(
                          "Suras List",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.lightGold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ListView.separated(
                            itemCount: Surahes.surahes.length,
                            itemBuilder: (context, index) =>
                                SuraCard(
                                  onClick: () {
                                    _onSuraTap(index, context);
                                  },
                                  index: index,
                                  quranData: Surahes.surahes[index],
                                ),
                            separatorBuilder: (context, index) => const Divider(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _cacheSurahIndex(int index) async {
    var indexString = index.toString();
    if (recentSurahIndexes.contains(indexString)) return;

    if (recentSurahIndexes.length == 5) {
      recentSurahIndexes.removeLast();
    }
    recentSurahIndexes.insert(0, indexString);

    await LocalStorageService.setStringList(
        LocalStorageKeys.recentSurah, recentSurahIndexes);
    _loadRecentSurah();
    setState(() {});
  }

  _onSuraTap(int index, context) {
    Navigator.pushNamed(
      context,
      SuraDetails.routeName,
      arguments: Surahes.surahes[index],
    );
    _cacheSurahIndex(index);
  }

  _loadRecentSurah() {
    //LocalStorageService.remove(LocalStorageKeys.recentSurah);
    recentSurahIndexes = [];
    recentSurahModels = [];
    recentSurahIndexes =
        LocalStorageService.getStringList(LocalStorageKeys.recentSurah) ?? [];

    for (var index in recentSurahIndexes) {
      var indexInt = int.tryParse(index);
      if (indexInt != null &&
          indexInt >= 0 &&
          indexInt < Surahes.surahes.length) {
        recentSurahModels.add(Surahes.surahes[indexInt]);
      }
    }
    if (mounted) {
      setState(() {});
    }
  }

  void search() {
    searchSurahModels =[];
    for (var index in Surahes.surahes) {
      if (index.suraNameAr.toLowerCase().contains(searchQuery.toLowerCase()) ||
          index.suraNameEn.toLowerCase().contains(searchQuery.toLowerCase())) {
        searchSurahModels.add(index);
      }
    }
  }

}
