import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'frontpage_desktop.dart';
import 'frontpage_mobile.dart';
import 'frontpage_tablet.dart';

class HomePage extends GetResponsiveView<Widget> {
  HomePage({super.key});

  @override
  Widget phone() => const FrontPageMobile(bulletText: true);

  @override
  Widget desktop() => const FrontPageDesktop();

  @override
  Widget tablet() => const FrontPageTablet(bulletText: true);
}
