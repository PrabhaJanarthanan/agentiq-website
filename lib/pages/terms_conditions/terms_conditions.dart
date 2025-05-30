import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'terms_conditions_desktop.dart';

class TermsandConditions extends GetResponsiveView {
  TermsandConditions({super.key}) : super(alwaysUseBuilder: false);

  // @override
  // Widget phone() => TermsMobile();

  @override
  Widget desktop() => TermsConditionsDesktop();

  // @override
  // Widget tablet() => TermsTablet();
}
