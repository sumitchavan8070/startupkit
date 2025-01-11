import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startupkit/general_widgets/primarytextfield.dart';
import 'package:startupkit/utils/colors.dart';
import 'package:startupkit/utils/typography.dart';

class NameInputFields extends StatelessWidget {
  const NameInputFields({
    super.key,
    required this.appTextStyle,
    required this.firstName,
    required this.listName,
  });

  final AppTextStyle appTextStyle;
  final TextEditingController firstName;
  final TextEditingController listName;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'First Name',
                style: appTextStyle.kBMediumMedium.copyWith(
                    color: AppColor.kGrayscaleDark100,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              PrimaryTextFormField(
                  borderRadius: BorderRadius.circular(24.r),
                  hintText: 'Sumit',
                  controller: firstName,
                  width: 155.w,
                  height: 52.h)
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Last Name',
                style: appTextStyle.kBMediumMedium.copyWith(
                    color: AppColor.kGrayscaleDark100,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              PrimaryTextFormField(
                  borderRadius: BorderRadius.circular(24.r),
                  hintText: 'Chavan',
                  controller: listName,
                  width: 155.w,
                  height: 52.h)
            ],
          )
        ],
      )
    ]);
  }
}
