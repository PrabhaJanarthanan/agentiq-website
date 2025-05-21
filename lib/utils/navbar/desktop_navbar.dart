import 'package:agentiqthingswebsite/utils/constants/logo.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../constants/sizes.dart';

class DesktopNavbar extends StatefulWidget {
  const DesktopNavbar({super.key});

  @override
  State<DesktopNavbar> createState() => _DesktopNavbarState();
}

class _DesktopNavbarState extends State<DesktopNavbar> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
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
                _navItem('Home'),
                _navItem('Features'),
                _navItem('Contact'),
                _navItem('About'),
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

  Widget _navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: () {},
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
