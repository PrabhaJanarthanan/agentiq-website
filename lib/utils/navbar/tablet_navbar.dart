import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../constants/sizes.dart';

class TabletNavbar extends StatefulWidget {
  const TabletNavbar({super.key});

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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Semantics(
                  child: AutoSizeText(
                    'Agentiq-Things',
                    maxLines: 1,
                    minFontSize: 16,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Demo',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Navigation row
          Wrap(
            spacing: 24,
            children: [
              _navItem('Home'),
              _navItem('Features'),
              _navItem('Contact'),
              _navItem('About'),
            ],
          )
        ],
      ),
    );
  }

  Widget _navItem(String title) {
    return InkWell(
      onTap: () {},
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
