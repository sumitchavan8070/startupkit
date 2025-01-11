import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:startupkit/models/county_list_model.dart';
import 'package:startupkit/utils/colors.dart';
import 'package:startupkit/utils/icons_path.dart';
import 'package:startupkit/utils/typography.dart';

class CountryClassContainer extends StatelessWidget {
  const CountryClassContainer({
    super.key,
    required this.countries,
    required this.appTextStyle,
  });

  final CountriesList countries;
  final AppTextStyle appTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16).copyWith(bottom: 0),
      child: Container(
        padding: const EdgeInsets.only(left: 23, top: 16, right: 24),
        decoration: BoxDecoration(
          color: AppColor.kWhite,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  countries.name,
                  style: appTextStyle.kBSmallSemiBold.copyWith(
                      color: AppColor.kGrayscaleDark100,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColor.kPrimaryTinyLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '06:30',
                    style: appTextStyle.kBExtraSmallSemiBold.copyWith(
                        color: AppColor.kPrimary, fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            ListTile(
              onTap: () {
                // Get.to(() => const DetailClassScreen());
              },
              contentPadding: EdgeInsets.zero,
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: AppColor.kPrimary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(17),
                  image: DecorationImage(
                    image: NetworkImage(
                      countries.flag,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                'Learning Arabic grammar',
                style: appTextStyle.kBSmallSemiBold.copyWith(
                    color: AppColor.kGrayscaleDark100,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              subtitle: Text(
                '6/12 Lessons',
                style: appTextStyle.kBSmallMedium.copyWith(
                    color: AppColor.kGrayscale40, fontWeight: FontWeight.w500, fontSize: 12),
              ),
              trailing: SvgPicture.asset(
                AppIcons.kArrow,
                width: 24,
                height: 24,
                color: AppColor.kPrimary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
