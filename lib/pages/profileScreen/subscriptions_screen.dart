import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startupkit/general_widgets/primary_button.dart';
import 'package:startupkit/models/subscription_model.dart';
import 'package:startupkit/utils/colors.dart';
import 'package:startupkit/utils/icons_path.dart';
import 'package:startupkit/utils/start_up_kit_app_bar.dart';
import 'package:startupkit/utils/typography.dart';

class SubscriptionsScreen extends StatefulWidget {
  const SubscriptionsScreen({super.key});

  @override
  State<SubscriptionsScreen> createState() => _SubscriptionsScreenState();
}

class _SubscriptionsScreenState extends State<SubscriptionsScreen> {
  final AppTextStyle appTextStyle = AppTextStyle();
  int selectedCard = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: StartUpKitAppBar(
        title: 'Subscription',
        showAction: false,
        backgroundColor: Colors.transparent,
        titleColor: AppColor.kGrayscaleDark100,
      ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: subscriptionList.length,
        itemBuilder: (context, index) {
          return SubscriptionCard(
            subscriptionModel: subscriptionList[index],
            isSelected: selectedCard == index,
            onTap: () {
              setState(() {
                selectedCard = index;
              });
            },
          );
        },
      ),
    );
  }
}

class SubscriptionCard extends StatelessWidget {
  final SubscriptionModel subscriptionModel;
  final bool isSelected;
  final VoidCallback onTap;

  const SubscriptionCard({
    super.key,
    required this.subscriptionModel,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final appTextStyle = AppTextStyle();
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 43.h),
            child: Container(
              width: 342.w,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColor.kPrimary.withOpacity(0.1)
                    : AppColor.kWhite,
                border: Border.all(
                  color: isSelected
                      ? AppColor.kPrimary
                      : AppColor.kPrimary.withOpacity(0.4),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 28.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${subscriptionModel.subscriptionRate}',
                          style: appTextStyle.kH5SemiBoldTextstyle.copyWith(
                            color: AppColor.kGrayscaleDark100,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                          ),
                        ),
                        subscriptionModel.saleTitle == 'Free'
                            ? PrimaryButton(
                          elevation: 0,
                          height: 25.h,
                          width: 80.w,
                          borderRadius: 24.r,
                          onTap: () {},
                          text: 'Current',
                          fontSize: 12.sp,
                          textColor: AppColor.kWhite,
                          bgColor: AppColor.kSecondary,
                        )
                            : Icon(
                          isSelected
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          color: isSelected
                              ? AppColor.kPrimary
                              : AppColor.kPrimary.withOpacity(0.4),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18.w, top: 16.h),
                    child: Row(
                      children: [
                        Text(
                          'Benefits:',
                          style: appTextStyle.kBMediumMedium.copyWith(
                            color: AppColor.kGrayscaleDark100,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18.w, right: 70.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: subscriptionModel.benefitsList.map((benefit) {
                        return Padding(
                          padding: EdgeInsets.only(top: 4.h),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: AppColor.kError,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                benefit,
                                style: appTextStyle.kBMediumMedium.copyWith(
                                  color: AppColor.kGrayscaleDark100,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 19.h),
                ],
              ),
            ),
          ),
          Positioned(
            top: 31.h,
            left: 45.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColor.kPrimary,
                borderRadius: BorderRadius.circular(24.r),
              ),
              height: 28.h,
              child: Center(
                child: Text(
                  subscriptionModel.saleTitle,
                  style: appTextStyle.kBSmallMedium.copyWith(
                    color: AppColor.kWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}