import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pixabay/core/routes/app_router.dart';
import 'package:pixabay/core/theme/app_theme.dart';
import 'package:pixabay/core/utils/locator/service_locator.dart';
import 'package:pixabay/features/home/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.ensureScreenSize();
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        child: MaterialApp(
          navigatorKey: navigatorKey,
          theme: darkTheme,
          home: const HomePage(),
        ),
      ),
    );
  }
}
