import 'package:agentiqthingswebsite/pages/footer/footer_mobile.dart';
import 'package:agentiqthingswebsite/pages/main_frontpage/frontpage_mobile.dart';
import 'package:agentiqthingswebsite/utils/navbar/mobile_navbar.dart';
import 'package:flutter/material.dart';

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
                FooterMobile(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}