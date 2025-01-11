import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startupkit/utils/colors.dart';

class AppTheme {
  //create a light theme with custom colors
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColor.kBackground,
      primarySwatch: Colors.grey,
      brightness: Brightness.dark,
      primaryColor: AppColor.kPrimary,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white.withOpacity(0),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thickness: WidgetStateProperty.all(
          6.w,
        ),
        radius: Radius.circular(28.r),
        thumbVisibility: WidgetStateProperty.all(true),
        trackVisibility: WidgetStateProperty.all(true),
        thumbColor: WidgetStateProperty.all(
            AppColor.kPrimary), // Set the color of the scrollbar thumb
        trackColor: WidgetStateProperty.all(AppColor.kGrayscale40),
      ));

  //create a dark theme with custom colors
  static ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      scaffoldBackgroundColor: AppColor.kBackground,
      brightness: Brightness.dark,
      primaryColor: AppColor.kPrimary,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.black.withOpacity(0),
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith());
}
