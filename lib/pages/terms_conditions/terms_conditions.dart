import 'package:agentiqthingswebsite/pages/terms_conditions/terms_conditions_mobile.dart';
import 'package:agentiqthingswebsite/pages/terms_conditions/terms_conditions_tablet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'terms_conditions_desktop.dart';

class TermsandConditions extends GetResponsiveView {
  TermsandConditions({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => TermsConditionsMobile();

  @override
  Widget desktop() => TermsConditionsDesktop();

  @override
  Widget tablet() => TermsConditionsTablet();
}
