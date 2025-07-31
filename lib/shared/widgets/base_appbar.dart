import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixabay/core/constants/app_colors.dart';
import 'package:pixabay/core/theme/app_theme.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String? titleText;
  final VoidCallback? onBackPressed;
  final bool showBackIcon;
  final Widget? secondaryWidget;
  final Color? backgroundColor;
  final Color? statusBarColor;
  final Color? titleColor;

  const BaseAppBar({
    super.key,
    this.height = kToolbarHeight,
    this.onBackPressed,
    this.secondaryWidget,
    this.titleText,
    this.showBackIcon = true,
    this.backgroundColor,
    this.statusBarColor,
    this.titleColor,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.black,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,

      title: Text(
        titleText ?? "",
        style: darkTheme.textTheme.bodyMedium,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      actions: [
        if (secondaryWidget != null)
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: secondaryWidget!,
          ),
      ],
    );
  }
}
