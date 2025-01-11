import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:startupkit/pages/splashScreen/splash_screen.dart';
import 'package:startupkit/utils/colors.dart';
import 'package:startupkit/utils/theme.dart';

// late Directory? appDocsDir;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // appDocsDir = await getApplicationDocumentsDirectory();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          title: 'StartUpKit',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColor.kBackground,
            primaryColor: AppColor.kPrimary,
            fontFamily: 'Poppins',
            useMaterial3: true,
            switchTheme: const SwitchThemeData(splashRadius: 0),
            popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.white,
              showDragHandle: true,
              dragHandleSize: Size(60, 4),
              clipBehavior: Clip.hardEdge,
            ),
            inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppColor.alabaster,
              hintStyle: const TextStyle(color: AppColor.stormGrey),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColor.kPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              },
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(letterSpacing: 0.15),
                backgroundColor: AppColor.kPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          darkTheme: AppTheme.darkTheme,
          home: const WelcomeScreen(),
        );
      },
    );
  }
}
