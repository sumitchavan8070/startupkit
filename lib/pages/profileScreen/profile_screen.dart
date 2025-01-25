import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:startupkit/general_widgets/Dialogs/logoutdialog.dart';
import 'package:startupkit/general_widgets/primarytextbutton.dart';
import 'package:startupkit/pages/profileScreen/edit_screen.dart';
import 'package:startupkit/pages/profileScreen/helpandsupport_screen.dart';
import 'package:startupkit/pages/profileScreen/language_screen.dart';
import 'package:startupkit/pages/profileScreen/notifications_screen.dart';
import 'package:startupkit/pages/profileScreen/security_screen.dart';
import 'package:startupkit/pages/profileScreen/subscriptions_screen.dart';
import 'package:startupkit/pages/profileScreen/widgets/optionstile.dart';
import 'package:startupkit/pages/profileScreen/widgets/progressinfobox.dart';
import 'package:startupkit/utils/colors.dart';
import 'package:startupkit/utils/icons_path.dart';
import 'package:startupkit/utils/images_path.dart';
import 'package:startupkit/utils/start_up_kit_app_bar.dart';
import 'package:startupkit/utils/typography.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final AppTextStyle appTextStyle = AppTextStyle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBackground,
      appBar: StartUpKitAppBar(
        title: 'Edit Profile',

        onActionTap: () {
          Get.to(() => const EditScreen());
        },
        actionIcon: AppIcons.kEditIcon,
        backgroundColor: Colors.transparent,
        titleColor: AppColor.kGrayscaleDark100,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          SizedBox(height: 24.h),
          SizedBox(
            width: 327.w,
            child: Row(children: [
              Container(
                width: 94.h,
                height: 94.h,
                decoration: BoxDecoration(
                    color: AppColor.kWhite,
                    borderRadius: BorderRadius.circular(51.r),
                    image: DecorationImage(
                      image: AssetImage(ImagesPath.kUserProfile),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(width: 12.w),
              ProgressInfoBox(appTextStyle: appTextStyle)
            ]),
          ),
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 19.h,
                  right: 9.w,
                  left: 24.w,
                ),
                child: SizedBox(
                  width: 342.w,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(
                      'General',
                      style: appTextStyle.kBMediumMedium.copyWith(
                          color: AppColor.kGrayscale40,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    OptionsTile(
                      appTextStyle: appTextStyle,
                      icons: AppIcons.kSettingIcon,
                      title: 'Settings',
                      onTab: () {
                        Get.to(() => const SecurityScreen());
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    OptionsTile(
                      appTextStyle: appTextStyle,
                      icons: AppIcons.kNotification,
                      title: 'Notification',
                      onTab: () {
                        Get.to(() => const NotificationsScreen());
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    OptionsTile(
                      appTextStyle: appTextStyle,
                      icons: AppIcons.kProfileCircle,
                      title: 'Subscription',
                      onTab: () {
                        Get.to(() => const SubscriptionsScreen());
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    OptionsTile(
                      appTextStyle: appTextStyle,
                      icons: AppIcons.kGlobal,
                      title: 'Language',
                      onTab: () {
                        Get.to(() => const LanguageScreen());
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      'Support',
                      style: appTextStyle.kBMediumMedium.copyWith(
                        color: AppColor.kGrayscale40,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    OptionsTile(
                      appTextStyle: appTextStyle,
                      icons: AppIcons.k24support,
                      title: 'Help Center',
                      onTab: () {
                        Get.to(() => const HelpAndSupportScreen());
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    SizedBox(
                      width: 342.w,
                      child: Center(
                        child: PrimaryTextButton(
                          onPressed: () {
                            Get.dialog(LogOutDialog(appTextStyle: appTextStyle));
                          },
                          title: 'LogOut',
                          textStyle: appTextStyle.kBLargeSemiBold.copyWith(
                              color: AppColor.kError, fontWeight: FontWeight.w600, fontSize: 16.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 33.h,
                    ),
                  ]),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
