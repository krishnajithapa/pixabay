import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'service_locator.config.dart'; // generated

final locator = GetIt.instance;

@InjectableInit(preferRelativeImports: true)
Future<void> setupServiceLocator() async {
  await locator.init();
}
