import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:startupkit/general_widgets/simple_appbar.dart';
import 'package:startupkit/utils/colors.dart';
import 'package:startupkit/utils/icons_path.dart';
import 'package:startupkit/utils/start_up_kit_app_bar.dart';
import 'package:startupkit/utils/typography.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  final TextEditingController searchController = TextEditingController();
  final AppTextStyle appTextStyle = AppTextStyle();
  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: StartUpKitAppBar(
        title: 'Help and Support',
        showAction: false,
        backgroundColor: Colors.transparent,
        titleColor: AppColor.kGrayscaleDark100,
      ) ??
          SimpleAppBar(
        title: 'Help and Support',
        appTextStyle: appTextStyle,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              _buildSearchField(),
              SizedBox(height: 32.h),
              ..._buildFaqList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextFormField(
      controller: searchController,
      style: appTextStyle.kBMediumMedium.copyWith(
        color: AppColor.kGrayscaleDark100,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
        hintText: 'Search...',
        hintStyle: appTextStyle.kBMediumMedium.copyWith(
          color: AppColor.kGrayscale40,
          fontSize: 14.sp,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.all(10.0),
          child: SvgPicture.asset(
            AppIcons.kSearch,
            width: 16.w,
            height: 16.h,
          ),
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            VerticalDivider(
              color: AppColor.kLine,
              thickness: 1,
              width: 32.w,
            ),
            Padding(
              padding: EdgeInsets.only(right: 14.w),
              child: SvgPicture.asset(AppIcons.kMicrophone),
            ),
          ],
        ),
        border: InputBorder.none,
      ),
    );
  }

  List<Widget> _buildFaqList() {
    final List<Map<String, String>> faqs = [
      {
        'question': 'How to start learning in the app?',
        'answer':
        "Checking app notifications typically involves ensuring that you have enabled notifications for the app on your device. This can usually be done through the app's settings or your device's notification settings."
      },
      {
        'question': "What are the app's features?",
        'answer':
        "The app offers a variety of features, including personalized learning paths, progress tracking, and regular updates to content to keep you engaged and informed."
      },
      {
        'question': 'How to stay updated with new content or updates?',
        'answer':
        "Enable notifications in the app's settings to stay updated with new content, feature updates, and announcements."
      },
      {
        'question': 'Can I track my progress?',
        'answer':
        "Yes, the app provides a dedicated section to track your learning progress, completed tasks, and achievements."
      },
      {
        'question': 'Can I customize my learning? ',
        'answer':
        "Absolutely! The app allows you to tailor your learning preferences, set goals, and choose topics of interest."
      },
    ];

    return faqs.asMap().entries.map((entry) {
      int index = entry.key;
      Map<String, String> faq = entry.value;

      return Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: Card(
          color: AppColor.kBackground2,
          child: AnimatedCrossFade(
            firstChild: ListTile(
              title: Text(
                faq['question']!,
                style: appTextStyle.kBMediumSemiBold.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              trailing: Icon(Icons.expand_more, color: AppColor.kPrimary),
              onTap: () {
                setState(() {
                  expandedIndex = index;
                });
              },
            ),
            secondChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    faq['question']!,
                    style: appTextStyle.kBMediumSemiBold.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                  trailing: Icon(Icons.expand_less, color: AppColor.kPrimary),
                  onTap: () {
                    setState(() {
                      expandedIndex = null;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  child: Text(
                    faq['answer']!,
                    style: appTextStyle.kBMediumMedium.copyWith(
                      color: AppColor.kGrayscale40,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
            crossFadeState: expandedIndex == index
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ),
      );
    }).toList();
  }
}
