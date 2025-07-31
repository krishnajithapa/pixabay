import 'package:flutter/material.dart';
import 'package:pixabay/core/constants/app_colors.dart';
import 'package:pixabay/shared/widgets/base_appbar.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    super.key,
    required this.body,
    this.appbarTitle,
    this.bottomNavigationBar,
    this.showBackIcon = false,
    this.appBarActionWidget,
  });
  final Widget body;
  final String? appbarTitle;
  final Widget? bottomNavigationBar;
  final Widget? appBarActionWidget;
  final bool showBackIcon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar:
          appbarTitle?.isNotEmpty == true
              ? BaseAppBar(
                titleText: appbarTitle ?? "",
                showBackIcon: showBackIcon,
                secondaryWidget: appBarActionWidget,
              )
              : null,
      body: Padding(padding: const EdgeInsets.all(16.0), child: body),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
