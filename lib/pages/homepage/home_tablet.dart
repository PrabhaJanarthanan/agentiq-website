import 'package:agentiqthingswebsite/pages/footer/footer_tablet.dart';
import 'package:agentiqthingswebsite/pages/main_frontpage/frontpage_tablet.dart';
import 'package:agentiqthingswebsite/utils/navbar/tablet_navbar.dart';
import 'package:flutter/material.dart';

class HomePageTablet extends StatelessWidget {
  const HomePageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabletNavbar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FrontPageTablet(bulletText: true),
                FooterTablet(),
              ],
            ),
          ),
        )
      ],
    );
  }
}