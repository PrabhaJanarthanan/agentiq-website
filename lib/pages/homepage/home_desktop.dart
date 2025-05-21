import 'package:agentiqthingswebsite/utils/navbar/desktop_navbar.dart';
import 'package:flutter/material.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DesktopNavbar()
      ],
    );
  }
}