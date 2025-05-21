import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'botify_desktop.dart';


class BotifyPage extends GetResponsiveView<Widget> {
  BotifyPage({super.key});

  // @override
  // Widget phone() => const FrontPageMobile();

  @override
  Widget desktop() => const BotifyDesktop();

  // @override
  // Widget tablet() => const FrontPageTablet();
}
