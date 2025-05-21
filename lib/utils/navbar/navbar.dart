import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'desktop_navbar.dart';


class Navbar extends GetResponsiveView<Widget> {
  Navbar({super.key});

  // @override
  // Widget phone() => const HomePageMobile();

  @override
  Widget desktop() => const DesktopNavbar();

  // @override
  // Widget tablet() => const HomePageTablet();
}
