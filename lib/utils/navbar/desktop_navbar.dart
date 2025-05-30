import 'package:agentiqthingswebsite/utils/constants/colors.dart';
import 'package:agentiqthingswebsite/utils/constants/logo.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:universal_html/html.dart' as html;


import '../constants/sizes.dart';

class DesktopNavbar extends StatefulWidget {
  final VoidCallback scrollToHome;
  final VoidCallback scrollToContact;
  final VoidCallback scrollToFeatures;
  final Function(int) onNavItemTap;

  const DesktopNavbar({super.key, 
  required this.scrollToHome, 
  required this.scrollToContact,
  required this.scrollToFeatures,
  required this.onNavItemTap,
  });

  @override
  State<DesktopNavbar> createState() => _DesktopNavbarState();
}

class _DesktopNavbarState extends State<DesktopNavbar> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: ATColors.white,
      padding: EdgeInsets.symmetric(
        vertical: ATSizes.defaultSpace,
        horizontal: screenWidth * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: navLogo(context),
          ),
          Flexible(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _navItem('Home', widget.scrollToHome, 'home', 0 ),
                _navItem('Features', widget.scrollToFeatures, 'features', 1, ),              
               
                _navItem('Contact', widget.scrollToContact, 'contact',2, ),
                _navItem('About', widget.scrollToHome, 'home',0, ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Demo',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

Widget _navItem(String title, VoidCallback scrollFunction, String hash, int index) {
  return Padding(
    padding: const EdgeInsets.all(ATSizes.appBarHeight),
    child: InkWell(
      onTap: () {
        html.window.location.hash = hash;
        scrollFunction(); // scroll to section ✅
       // Get.toNamed('/home?section=$routeSection', preventDuplicates: false);
        // if (index == 0) {
        //   Get.toNamed('/home');
        // } else if (index == 1) {
        //   Get.toNamed('/features');
        // } else if (index == 2) {
        //   Get.toNamed('/contact');
        // }
        //widget.onNavItemTap(index); 
      },
      mouseCursor: SystemMouseCursors.click,
      child: Semantics(
        label: title,
        child: AutoSizeText(
          title,
          minFontSize: 10,
          maxLines: 1,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    ),
  );
}

}
