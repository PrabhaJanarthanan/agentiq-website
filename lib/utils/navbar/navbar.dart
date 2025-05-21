import 'package:agentiqthingswebsite/utils/navbar/mobile_navbar.dart';
import 'package:agentiqthingswebsite/utils/navbar/tablet_navbar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'desktop_navbar.dart';


class Navbar extends GetResponsiveView<Widget> {
  Navbar({super.key});

  @override
  Widget phone() => const MobileNavbar();

  @override
  Widget desktop() => const DesktopNavbar();

  @override
  Widget tablet() => const TabletNavbar();
}
