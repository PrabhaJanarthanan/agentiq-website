import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'privacy_policy_desktop.dart';
import 'privacy_policy_mobile.dart';
import 'privacy_policy_tablet.dart';


class PrivacyPolicy extends GetResponsiveView {
  PrivacyPolicy({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => PrivacyPolicyMobile();

  @override
  Widget desktop() => PrivacyPolicyDesktop();

  @override
  Widget tablet() => PrivacyPolicyTablet();
}
