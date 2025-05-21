import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'home_desktop.dart';
import 'home_tablet.dart';

class HomePage extends GetResponsiveView<Widget> {
  HomePage({super.key});

  // @override
  // Widget phone() => const HomePageMobile();

  @override
  Widget desktop() => const HomePageDesktop();

  @override
  Widget tablet() => const HomePageTablet();
}
