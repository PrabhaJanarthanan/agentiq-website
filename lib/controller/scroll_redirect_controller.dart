import 'package:get/get.dart';

class ScrollRedirectController extends GetxController {
  bool _hasRedirected = false;

  @override
  void onReady() {
    super.onReady();

    final currentRoute = Get.currentRoute;

    // Only run redirect on first load
    if (!_hasRedirected && currentRoute != '/') {
      _hasRedirected = true;

      // Delay redirect slightly to avoid conflict
      Future.delayed(Duration(milliseconds: 100), () {
        Get.offAllNamed('/');
      });
    }
  }
}
