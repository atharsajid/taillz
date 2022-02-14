import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taillz/screens/resgistrationscreen/firstscreen/first_screen.dart';
import 'package:taillz/screens/splash/splashScreen.dart';
import 'Localization/localization_service.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent
    
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
      statusBarIconBrightness: Brightness.dark // dark text for status bar
      ));*/

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final localizationController = Get.put(LocalizationController());

  Color primaryColor = Color(0xffff0000);

  Color scaffoldColor = Color(0xffff0000);

  Color backgroundColor = Color(0xffff0000);

  Color dialogBackgroundColor = Color(0xffff0000);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        init: localizationController,
        builder: (LocalizationController controller) {
          return MaterialApp(
            locale: controller.currentLanguage != ''
                ? Locale(controller.currentLanguage, '')
                : null,
            localeResolutionCallback:
                LocalizationService.localeResolutionCallBack,
            supportedLocales: LocalizationService.supportedLocales,
            localizationsDelegates: LocalizationService.localizationsDelegate,

            debugShowCheckedModeBanner: false,
            title: 'taillz',
            home: SplashScreen(),
            // home: _app(),
          );
        });
  }
}

const MaterialColor kPrimaryColor = const MaterialColor(
  0xFF0E7AC7,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);
