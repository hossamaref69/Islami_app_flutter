import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/constants/local_storage_keys.dart';
import 'package:islami/core/service/local_storage_service.dart';
import 'package:islami/ui/screens/onboarding/onboarding_screen.dart';
import '../home/home_layout.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Duration _duration = const Duration(milliseconds: 2000);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      var isFirstTime =
          LocalStorageService.getBool(LocalStorageKeys.isFirstTimeRun) ?? true;
      Navigator.pushReplacementNamed(
        context,
        isFirstTime ? OnboardingScreen.routeName : HomeLayout.routeName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AppAssets.splashBg,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: FadeInDown(
                duration: _duration,
                child: Image.asset(
                  AppAssets.splashGlow,
                  height: size.height * 0.30,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
              child: Align(
                alignment: Alignment.topCenter,
                child: ZoomIn(
                  duration: _duration,
                  child: Image.asset(
                    fit: BoxFit.contain,
                    AppAssets.mosqueLogo,
                    height: size.height * 0.35,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.25),
              child: Align(
                alignment: Alignment.topLeft,
                child: FadeInLeft(
                  duration: _duration,
                  child: Image.asset(
                    AppAssets.splashLeftShape,
                    width: size.width * 0.25,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.10),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FadeInRight(
                  duration: _duration,
                  child: Image.asset(
                    AppAssets.splashRightShape,
                    width: size.width * 0.25,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ZoomIn(
                duration: _duration,
                child: Image.asset(
                  AppAssets.splashLogo,
                  width: size.width * .35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
