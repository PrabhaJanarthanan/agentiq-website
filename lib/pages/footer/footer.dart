import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'footer_desktop.dart';
import 'footer_mobile.dart';
import 'footer_tablet.dart';


class HomePage extends GetResponsiveView<Widget> {
  HomePage({super.key});

  @override
  Widget phone() => const FooterMobile();

  @override
  Widget desktop() => const FooterDesktop();

  @override
  Widget tablet() => const FooterTablet();
}
