import 'package:agentiqthingswebsite/utils/constants/logo.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:universal_html/html.dart' as html;
import '../constants/sizes.dart';

class TabletNavbar extends StatefulWidget {
  final VoidCallback scrollToHome;
  final VoidCallback scrollToContact;
  final VoidCallback scrollToFeatures;
  final Function(int) onNavItemTap;
  const TabletNavbar(
      {super.key,
      required this.scrollToHome,
      required this.scrollToContact,
      required this.scrollToFeatures,
      required this.onNavItemTap});

  @override
  State<TabletNavbar> createState() => _TabletNavbarState();
}

class _TabletNavbarState extends State<TabletNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: ATSizes.defaultSpace * 0.8,
        horizontal: ATSizes.defaultSpace,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: logo + button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              navLogo(context),

              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text(
              //     'Demo',
              //     style: Theme.of(context).textTheme.bodyMedium,
              //   ),
              // ),
            ],
          ),
          const SizedBox(height: 12),
          // Navigation row
          Wrap(
            spacing: 24,
            children: [
              _navItem(
                'Home',
                widget.scrollToHome,
                'home',
                0,
              ),
              _navItem('Features', widget.scrollToFeatures, 'features', 1),
              _navItem('Contact', widget.scrollToContact, 'contact', 2),
              _navItem('About', widget.scrollToHome, 'home', 0),
            ],
          )
        ],
      ),
    );
  }

  Widget _navItem(
      String title, VoidCallback scrollFunction, String path, int index) {
    return InkWell(
      onTap: () {
        if (html.window.location.pathname != '/$path') {
          html.window.history.pushState(null, '', '/$path');
        }
        scrollFunction(); // scroll to section ✅

        // if (index == 0) {
        //   Get.toNamed('/home');
        // } else if (index == 1) {
        //   Get.toNamed('/features');
        // } else if (index == 2) {
        //   Get.toNamed('/contact');
        // }
        widget.onNavItemTap(index);
      },
      mouseCursor: SystemMouseCursors.click,
      child: Semantics(
        child: AutoSizeText(
          title,
          minFontSize: 12,
          maxLines: 1,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
