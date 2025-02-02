import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/constants/local_storage_keys.dart';
import 'package:islami/core/service/local_storage_service.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/model/on_boarding_model.dart';
import 'package:islami/ui/screens/home/home_layout.dart';
import 'package:islami/ui/screens/onboarding/widget/on_boarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static String routeName = "onboarding_screen";

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var activeIndex = 0;
  var controller = PageController();
  @override
  void initState() {
    super.initState();
    LocalStorageService.setBool(LocalStorageKeys.isFirstTimeRun, false);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.brown,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 12,
              ),
              Image.asset(
                AppAssets.mosqueIslami,
                height: size.height * .16,
              ),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (index) {
                    activeIndex = index;
                    setState(() {});
                  },
                  itemCount: OnBoardingModel.onboardingList.length,
                  itemBuilder: (context, index) {
                    return OnBoardingItem(
                      onBoardingModel: OnBoardingModel.onboardingList[index],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: activeIndex !=0,
                    replacement: const Spacer(),
                    child: TextButton(
                      onPressed: () {
                        controller.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                        if (activeIndex > 0) {
                          activeIndex--;
                        }
                      },
                      child: Text(
                        "Back",
                        style: TextStyle(
                            fontFamily: "Janna",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.gold),
                      ),
                    ),
                  ),
                  const Spacer(),
                  AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: OnBoardingModel.onboardingList.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.gold,
                      dotColor: const Color(0xff707070),
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      if(activeIndex == OnBoardingModel.onboardingList.length -1){
                        Navigator.pushReplacementNamed(context, HomeLayout.routeName);
                        return;
                      }
                      controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      if (activeIndex < OnBoardingModel.onboardingList.length) {
                        activeIndex++;
                      }
                    },
                    child: Text(
                      activeIndex == OnBoardingModel.onboardingList.length - 1
                      ? "Finish"
                      :"Next",
                      style: TextStyle(
                          fontFamily: "Janna",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.gold),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
