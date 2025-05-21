import 'package:agentiqthingswebsite/utils/navbar/tablet_navbar.dart';
import 'package:flutter/material.dart';

class HomePageTablet extends StatelessWidget {
  const HomePageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabletNavbar(),
      ],
    );
  }
}