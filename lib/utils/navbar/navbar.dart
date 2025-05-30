import 'package:agentiqthingswebsite/utils/navbar/mobile_navbar.dart';
import 'package:agentiqthingswebsite/utils/navbar/tablet_navbar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'desktop_navbar.dart';


class Navbar extends GetResponsiveView {
  final VoidCallback scrollToHome;
  final VoidCallback scrollToContact;
  final VoidCallback scrollToFeatures;
  final Function(int) onNavItemTap;


  Navbar(this.scrollToHome, this.scrollToContact, this.scrollToFeatures, this.onNavItemTap, {super.key});

  @override
  Widget phone() =>  MobileNavbar(
    scrollToHome : scrollToHome,
    scrollToContact : scrollToContact,
    scrollToFeatures : scrollToFeatures,
    onNavItemTap: onNavItemTap,
    

  );

  @override
  Widget desktop() =>  DesktopNavbar(
    scrollToHome: scrollToHome,
    scrollToContact: scrollToContact,
    scrollToFeatures: scrollToFeatures, 
    onNavItemTap: onNavItemTap,
  );

  @override
  Widget tablet() =>  TabletNavbar(
    scrollToHome: scrollToHome,
    scrollToContact: scrollToContact,
    scrollToFeatures: scrollToFeatures, 
    onNavItemTap: onNavItemTap,
  );
}
