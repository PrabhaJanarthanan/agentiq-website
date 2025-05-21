import 'package:agentiqthingswebsite/pages/botify_description/botify_desktop.dart';
import 'package:agentiqthingswebsite/pages/footer/footer_desktop.dart';
import 'package:agentiqthingswebsite/pages/main_frontpage/frontpage_desktop.dart';
import 'package:agentiqthingswebsite/utils/navbar/desktop_navbar.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DesktopNavbar(),
        Expanded(
          
          child: SingleChildScrollView(
            padding: EdgeInsets.all(ATSizes.defaultSpace*2),
            child: Column(
            children: [
              FrontPageDesktop(),
              BotifyDesktop(),
              SizedBox(height: ATSizes.spaceBtwSections),
              FooterDesktop(),
            ],
          )),
        ),
     
        
      ],
    );
  }
}