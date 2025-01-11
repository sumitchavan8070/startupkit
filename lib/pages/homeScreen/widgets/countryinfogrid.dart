import 'package:flutter/material.dart';
import 'package:startupkit/data/helper/countries_list.dart';
import 'package:startupkit/general_widgets/customtrack_shape.dart';

import 'package:startupkit/models/county_list_model.dart';
import 'package:startupkit/utils/colors.dart';
import 'package:startupkit/utils/typography.dart';

class CountryInfoGrid extends StatelessWidget {
  final CountriesList countries;
  final AppTextStyle appTextStyle;

  const CountryInfoGrid({
    Key? key,
    required this.countries,
    required this.appTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400, // Direct height value
      decoration: BoxDecoration(
        color: AppColor.kWhite,
        borderRadius: BorderRadius.circular(25), // Removed .r
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 11), // Removed .h and .w
            child: Align(
              alignment: Alignment.topLeft,
              child: CircleAvatar(
                radius: 20, // Removed .r
                backgroundImage: NetworkImage(countries.flag),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10), // Removed .w
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  get(countries.name),
                  style: appTextStyle.kBMediumSemiBold.copyWith(
                    color: AppColor.kGrayscaleDark100,
                    fontWeight: FontWeight.bold,
                    fontSize: 14, // Direct font size value
                  ),
                ),
                const SizedBox(
                  height: 3, // Direct height value
                ),
                Text(
                  'Common Korean Language',
                  style: appTextStyle.kBExtraSmallMedium.copyWith(
                    color: AppColor.kGrayscale40,
                    fontWeight: FontWeight.w500,
                    fontSize: 10, // Direct font size value
                  ),
                ),
                const SizedBox(
                  height: 4, // Direct height value
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${countries.percentage.toString().split('.')[0]}%',
                      style: appTextStyle.kBExtraSmallMedium.copyWith(
                        color: AppColor.kPrimary,
                        fontWeight: FontWeight.w500,
                        fontSize: 10, // Direct font size value
                      ),
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 10, // Direct height value
                    trackShape: CustomTrackShape(),
                  ),
                  child: Slider(
                    activeColor: AppColor.kPrimary.withOpacity(0.3),
                    thumbColor: AppColor.kPrimary,
                    inactiveColor: AppColor.kBackground2,
                    min: 0.0,
                    max: 1.0,
                    value: 0 + double.parse('.${countries.percentage.toString().split('.')[0]}'),
                    onChanged: (val) {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
