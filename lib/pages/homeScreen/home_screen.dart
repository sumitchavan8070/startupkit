import 'package:carousel_slider/carousel_slider.dart' as cs;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:startupkit/data/helper/countries_list.dart';
import 'package:startupkit/general_widgets/custom_appbar.dart';
import 'package:startupkit/general_widgets/custom_carousel_slider.dart';
import 'package:startupkit/models/user_model.dart';
import 'package:startupkit/pages/homeScreen/widgets/countryinfogrid.dart';
import 'package:startupkit/pages/homeScreen/widgets/lessonrow_widget.dart';
import 'package:startupkit/pages/quizScreen/quiz_screen.dart';
import 'package:startupkit/utils/typography.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppTextStyle appTextStyle = AppTextStyle();
  final carouselController = cs.CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        profileImage: currentUser.profileImage,
        name: currentUser.name,
        address: currentUser.address,
        appTextStyle: appTextStyle,
      ),
      body: Column(
        children: [
          SizedBox(height: 35.h),
          CustomCarouselSlider(appTextStyle: appTextStyle, carouselController: carouselController),
          SizedBox(
            height: 24.h,
          ),
          LessonsRow(appTextStyle: appTextStyle),
          SizedBox(height: 16.h),
          Expanded(
            child: GridView.builder(
              itemCount: countriesList.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 24, right: 23),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final countries = countriesList[index];
                return GestureDetector(
                  onTap: () {
                    // print(
                    //     'send to quiz screen country name ${countries.name.split('_')[0].toString()}');
                    Get.to(() => QuizScreen(countryName: countries.name.split('_')[0].toString()));
                  },
                  child: CountryInfoGrid(countries: countries, appTextStyle: appTextStyle),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
