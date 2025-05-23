import 'package:agentiqthingswebsite/pages/footer/footer_mobile.dart';
import 'package:agentiqthingswebsite/pages/main_frontpage/frontpage_mobile.dart';
import 'package:agentiqthingswebsite/pages/scrolling_features/auto_scroll_widgets/auto_scroll_features_mobile.dart';
import 'package:agentiqthingswebsite/pages/scrolling_features/content/scrolling_features_content.dart';
import 'package:agentiqthingswebsite/utils/navbar/mobile_navbar.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MobileNavbar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FrontPageMobile(bulletText: true),
                SizedBox(height: ATSizes.spaceBtwSections),
                AutoScrollFeaturesMobile(features: scrollingFeaturesUtils),
                SizedBox(height: ATSizes.spaceBtwSections),
                FooterMobile(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}