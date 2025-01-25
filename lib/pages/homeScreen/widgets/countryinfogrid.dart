import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      decoration: BoxDecoration(
        color: AppColor.kWhite,
        borderRadius: BorderRadius.circular(25), // Removed .r
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    countries.flag,
                    width: 24.0, // Adjust the width to your preferred size
                    height: 24.0, // Adjust the height to your preferred size
                    fit: BoxFit.cover, // Ensures the image fits within the circular shape
                  ),
                ),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    countries.name.replaceAll("_", " "),
                    style: appTextStyle.kBMediumSemiBold.copyWith(
                      color: AppColor.kGrayscaleDark100,
                      fontWeight: FontWeight.bold,
                      fontSize: 14, // Direct font size value
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10), // Removed .w
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 3),
                Text(
                  'Common Korean Language',
                  style: appTextStyle.kBExtraSmallMedium.copyWith(
                    color: AppColor.kGrayscale40,
                    fontWeight: FontWeight.w500,
                    fontSize: 10, // Direct font size value
                  ),
                ),
                const SizedBox(height: 4),
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
                    trackHeight: 2, // Direct height value
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
