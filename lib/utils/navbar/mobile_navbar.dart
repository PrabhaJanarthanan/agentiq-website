import 'package:agentiqthingswebsite/utils/constants/logo.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:universal_html/html.dart' as html;
import '../constants/colors.dart';
import '../constants/sizes.dart';

class MobileNavbar extends StatefulWidget {
  final VoidCallback scrollToHome;
  final VoidCallback scrollToContact;
  final VoidCallback scrollToFeatures;
  final Function(int) onNavItemTap;

  const MobileNavbar(
    {super.key, 
    required this.scrollToHome, 
    required this.scrollToContact, 
    required this.scrollToFeatures, 
    required this.onNavItemTap});

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
          child: Material(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildMenuItem(Iconsax.home, 'Home', widget.scrollToHome, 'home', 0),
                    _buildMenuItem(Iconsax.element_equal, 'Features', widget.scrollToFeatures, 'features', 1),
                    _buildMenuItem(Iconsax.mobile, 'Contact Us', widget.scrollToContact, 'contact', 2),
                    _buildMenuItem(Iconsax.profile_circle, 'About', widget.scrollToHome, 'home', 3),
                  
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String label, VoidCallback scrollFunction, String path, int index) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: ATColors.primaryColor, size: ATSizes.iconSm),
          SizedBox(width: ATSizes.defaultSpace / 2),
          AutoSizeText(label, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
      onTap: (){
        if (html.window.location.pathname != '/$path') {
          html.window.history.pushState(null, '', '/$path');
        }
       scrollFunction();
        widget.onNavItemTap(index); 
        setState(() {
          _isExpanded = false; // Close the menu after selection
        });
 
      },
    );
  }
}
