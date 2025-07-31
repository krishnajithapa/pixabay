import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A helper class for consistent paddings, spacings, and sizes
class UIHelper {
  // Spacing
  static SizedBox verticalSpace(double height) => SizedBox(height: height.h);
  static SizedBox horizontalSpace(double width) => SizedBox(width: width.w);

  static SizedBox get verticalSpaceSmall => SizedBox(height: 8.h);
  static SizedBox get verticalSpaceMedium => SizedBox(height: 16.h);
  static SizedBox get verticalSpaceLarge => SizedBox(height: 32.h);

  static SizedBox get horizontalSpaceSmall => SizedBox(width: 8.w);
  static SizedBox get horizontalSpaceMedium => SizedBox(width: 16.w);
  static SizedBox get horizontalSpaceLarge => SizedBox(width: 32.w);

  // Padding
  static EdgeInsets get pagePadding => EdgeInsets.symmetric(horizontal: 16.w);

  // Border radius
  static BorderRadius get defaultRadius => BorderRadius.circular(12.r);

  // Icon sizes
  static double get iconSizeSmall => 16.sp;
  static double get iconSizeMedium => 24.sp;
  static double get iconSizeLarge => 32.sp;

  // Text sizes
  static double get textSizeSmall => 12.sp;
  static double get textSizeMedium => 16.sp;
  static double get textSizeLarge => 20.sp;

  // Elevation
  static double get cardElevation => 4.0;

  static double get cornerRadiusMedium => 16.r;
}
