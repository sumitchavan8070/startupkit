import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:startupkit/utils/icons_path.dart';

class StartUpKitAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onActionTap;
  final String? actionIcon;
  final bool showAction;
  final Color backgroundColor;
  final Color titleColor;
  final bool? backButton;

  const StartUpKitAppBar({
    super.key,
    required this.title,
    this.onActionTap,
    this.actionIcon,
    this.showAction = true,
    this.backgroundColor = Colors.transparent,
    this.titleColor = Colors.black,
    this.backButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall
      ),
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: SvgPicture.asset(
            AppIcons.kBack,
            height: 24,
            width: 24,
          ),
        ),
      ),
      actions: showAction && actionIcon != null
          ? [
              GestureDetector(
                onTap: onActionTap,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(actionIcon!),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ]
          : [],
      elevation: 0,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
