import 'package:agentiqthingswebsite/pages/privacy_policy/privacy_policy.dart';
import 'package:get/get.dart';

import '../../pages/homepage/homepage.dart';
import '../../pages/return_refund/return_refund.dart';
import '../../pages/terms_conditions/terms_conditions.dart';

final getPages = [
  GetPage(name: '/', page: () => HomePage()),
  GetPage(name: '/features', page: () => HomePage()),
  GetPage(name: '/contact', page: () => HomePage()),

  //Footer
  GetPage(name: '/privacypolicy', page: ()=> PrivacyPolicy()),
  GetPage(name: '/returnsrefund', page: () => RefundPage()),
  GetPage(name: '/termsandconditions', page: () => TermsandConditions()),
];
