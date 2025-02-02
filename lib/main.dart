import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:islami/core/service/local_storage_service.dart';
import 'package:islami/ui/screens/home/home_layout.dart';
import 'package:islami/ui/screens/onboarding/onboarding_screen.dart';
import 'package:islami/ui/screens/soura_details/sura_details.dart';
import 'package:islami/ui/screens/splash/splash_screen.dart';
import 'core/utlis/loading.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorageService.init();

  runApp(const MyApp());
  Loading.configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeLayout.routeName: (_) => const HomeLayout(),
        OnboardingScreen.routeName: (_) => const OnboardingScreen(),
        SuraDetails.routeName: (_) => const SuraDetails()
      },
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
    );
  }
}

