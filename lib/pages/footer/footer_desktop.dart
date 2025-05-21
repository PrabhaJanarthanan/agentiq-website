import 'package:agentiqthingswebsite/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constants/sizes.dart';

class FooterDesktop extends StatefulWidget {
  const FooterDesktop({super.key});

  @override
  State<FooterDesktop> createState() => _FooterDesktopState();
}

class _FooterDesktopState extends State<FooterDesktop> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 6,
     
      child: Padding(
        padding: const EdgeInsets.all(ATSizes.defaultSpace),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 30),
        
            // === Contact Info & Socials ===
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Contact Information
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset( ATImages.atLogo, height: 20, width: 20 ),
                        SizedBox(width: ATSizes.spaceBtwItems/2),
                        Text(
                          'Agentiq - Things, Inc.',
                          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text('Email: info@agentiq-things.tech',
                        style: textTheme.bodySmall?.copyWith(color: Colors.grey.shade700)),
                    const SizedBox(height: 5),
                    Text('Phone: +91 9488501457',
                        style: textTheme.bodySmall?.copyWith(color: Colors.grey.shade700)),
                    const SizedBox(height: 5),
                    Text('Address: 118, Mettur Road, Erode',
                        style: textTheme.bodySmall?.copyWith(color: Colors.grey.shade700)),
                  ],
                ),
        
                // Social Media Icons
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Follow us',
                      style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _socialIcon(Image.asset(ATImages.facebook), 'https://facebook.com'),
                        const SizedBox(width: 15),
                        _socialIcon(Image.asset(ATImages.instagram), 'https://instagram.com'),
                        const SizedBox(width: 15),
                        _socialIcon(Image.asset(ATImages.twitter), 'https://twitter.com'),
                        const SizedBox(width: 15),
                        _socialIcon(Image.asset(ATImages.linkedin), 'https://linkedin.com'),
                      ],
                    )
                  ],
                ),
              ],
            ),
        
            const SizedBox(height: 40),
        
            // === Footer Links ===
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _footerLink('Privacy Policy', '/privacypolicy'),
                const SizedBox(width:  ATSizes.spaceBtwSections),
                _footerLink('Terms & Conditions', '/termsandconditions'),
                const SizedBox(width:  ATSizes.spaceBtwSections),
                _footerLink('Refund Policy', '/returnsrefund'),
              ],
            ),
        
            const SizedBox(height: 25),
        
            // === Copyright ===
            Text(
              '© 2025 Agentiq - Things, Inc. All rights reserved.',
              style: textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _footerLink(String text, String route) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Get.toNamed(route),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            decoration: TextDecoration.underline,
          )
        
        ),
      ),
    );
  }

 Widget _socialIcon(Widget iconWidget, String url,  {double size = 24}) {
  return InkWell(
    onTap: () => launchUrl(Uri.parse(url)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: size,
        
        height: size,
        child: iconWidget),
      
    ),
  );
}

}
