import 'package:agentiqthingswebsite/utils/constants/logo.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';

class MobileNavbar extends StatefulWidget {
  const MobileNavbar({super.key});

  @override
  State<MobileNavbar> createState() => _MobileNavbarState();
}

class _MobileNavbarState extends State<MobileNavbar> {
  bool _isExpanded = false;

  void _toggleMenu() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(ATSizes.defaultSpace),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              navLogo(context),
              IconButton(
                onPressed: _toggleMenu,
                icon: Icon(
                  _isExpanded ? Iconsax.close_square : Iconsax.menu,
                  color: ATColors.primaryColor,
                ),
              ),
            ],
          ),
        ),

        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          constraints: BoxConstraints(
            maxHeight: _isExpanded ? 240 : 0,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildMenuItem(Iconsax.home, 'Home', () {}),
                  _buildMenuItem(Iconsax.element_equal, 'Features', () {}),
                  _buildMenuItem(Iconsax.mobile, 'Contact Us', () {}),
                  _buildMenuItem(Iconsax.profile_circle, 'About', () {}),
                
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String label, VoidCallback onTap) {
    return ListTile(
     // contentPadding: EdgeInsets.symmetric(vertical: 4.0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: ATColors.primaryColor, size: ATSizes.iconSm),
          SizedBox(width: ATSizes.defaultSpace / 2),
          AutoSizeText(label, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
      onTap: onTap,
    );
  }
}
