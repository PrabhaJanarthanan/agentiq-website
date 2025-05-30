import 'package:agentiqthingswebsite/pages/terms_conditions/terms_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


import '../../common/appbar/appbar.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class TermsConditionsTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ATAppBar(
       showBackArrow: true,
       title: Text('Back', style: Theme.of(context).textTheme.bodySmall),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
              maxWidth: 750), 
          padding: const EdgeInsets.symmetric(
              vertical: 60, horizontal: 40), 
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Semantics(
                  child: Text(
                    'Terms and Conditions',
                    style: Theme.of(context).textTheme.headlineSmall
                  ),
                ),
                SizedBox(height: ATSizes.spaceBtwSections),
                Semantics(
                  child: Text(
                    termsAndConditionsContent,
                  style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/'); // Navigate to Home Page
        },
        child: const Icon(Iconsax.home),
        backgroundColor: ATColors.primaryColor, 
      ),
    );
  }
}
