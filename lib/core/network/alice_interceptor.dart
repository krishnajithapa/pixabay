import 'package:flutter_alice/alice.dart';
import 'package:pixabay/core/routes/app_router.dart';

class AliceInterceptor {
  Alice alice = Alice(
    showNotification: true,
    navigatorKey: navigatorKey,
    showInspectorOnShake: true,
  );
}
