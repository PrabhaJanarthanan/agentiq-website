import 'package:agentiqthingswebsite/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/constants/sizes.dart';

class FooterMobile extends StatelessWidget {
  const FooterMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(ATSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: ATSizes.spaceBtwItems),

           Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Column: Logo + Contact
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(ATImages.atLogo, height: 28, width: 28),
                          const SizedBox(width: ATSizes.spacesBtwTexts),
                          Semantics(
                            child: Text(
                              'Agentiq - Things, Inc.',
                              style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Semantics(child: Text('Email: info@agentiq-things.tech', style: textTheme.labelLarge)),
                      const SizedBox(height: 5),
                      Semantics(child: Text('Phone: +91 9488501457', style: textTheme.labelLarge)),
                      const SizedBox(height: 5),
                      Semantics(child: Text('Address: 118, Mettur Road, Erode', style: textTheme.labelLarge)),
                    ],
                  ),
                ),

                const SizedBox(width: 40),

                // Right Column: Social Icons
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Follow us', style: textTheme.labelMedium),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 15,
                        children: [
                          _socialIcon(Image.asset(ATImages.facebook), 'https://facebook.com'),
                          _socialIcon(Image.asset(ATImages.instagram), 'https://instagram.com'),
                          _socialIcon(Image.asset(ATImages.twitter), 'https://twitter.com'),
                          _socialIcon(Image.asset(ATImages.linkedin), 'https://linkedin.com'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),


            const SizedBox(height: 25),
            Divider(height: 2),
            const SizedBox(height: 15),

            // === Footer Links ===
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                children: [
                  _footerLink(context, 'Privacy Policy', '/privacypolicy'),
                  _footerLink(context, 'Terms & Conditions', '/termsandconditions'),
                  _footerLink(context, 'Refund Policy', '/returnsrefund'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // === Copyright ===
            Center(
              child: Semantics(
                child: Text(
                  '© 2025 Agentiq - Things, LLP. All rights reserved.',
                  textAlign: TextAlign.center,
                  style: textTheme.bodySmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _footerLink(BuildContext context, String text, String route) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Get.toNamed(route),
        child: Semantics(
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  decoration: TextDecoration.underline,
                ),
          ),
        ),
      ),
    );
  }

  Widget _socialIcon(Widget iconWidget, String url, {double size = 20}) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: SizedBox(width: size, height: size, child: iconWidget),
    );
  }
}
