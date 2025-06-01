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
            const SizedBox(height: ATSizes.spaceBtwSections),
        
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
                        Semantics(
                          child: Text(
                            'Agentiq - Things, Inc.',
                            style: textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: ATSizes.spacesBtwTexts),
                    Semantics(
                      child: Text('Email: info@agentiq-things.tech',
                          style: textTheme.bodySmall),
                    ),
                    const SizedBox(height: ATSizes.spacesBtwTexts/2),
                    Semantics(
                      child: Text('Phone: +91 9488501457',
                          style: textTheme.bodySmall),
                    ),
                    const SizedBox(height: ATSizes.spacesBtwTexts/2),
                    Semantics(
                      child: Text('Address: 118, Mettur Road, Erode',
                          style: textTheme.bodySmall),
                    ),
                  ],
                ),
        
                // Social Media Icons
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Semantics(
                      child: Text(
                        'Follow us',
                        style: textTheme.titleSmall,
                      ),
                    ),
                    const SizedBox(height: ATSizes.spaceBtwItems),
                    Row(
                      children: [
                        _socialIcon(Image.asset(ATImages.facebook,), 'https://facebook.com'),
                        const SizedBox(width: ATSizes.spaceBtwItems),
                        _socialIcon(Image.asset(ATImages.instagram), 'https://www.instagram.com/agentiq_things/'),
                        const SizedBox(width: ATSizes.spaceBtwItems),
                        _socialIcon(Image.asset(ATImages.twitter), 'https://twitter.com'),
                        const SizedBox(width: ATSizes.spaceBtwItems),
                        _socialIcon(Image.asset(ATImages.linkedin), 'https://linkedin.com'),
                      ],
                    )
                  ],
                ),
              ],
            ),
        
            const SizedBox(height: ATSizes.spaceBtwSections),
        
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
        
            const SizedBox(height: ATSizes.spaceBtwSections),
        
            // === Copyright ===
            Semantics(
              child: Text(
                '© 2025 Agentiq - Things, Inc. All rights reserved.',
                style: textTheme.bodySmall,
              ),
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

 Widget _socialIcon(Widget iconWidget, String url,  { double size = ATSizes.iconMd}) {
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
