import 'package:agentiqthingswebsite/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/appbar/appbar.dart';
import '../../utils/constants/sizes.dart';
import 'privacypolicy_content.dart';


class PrivacyPolicyDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:  ATAppBar(
       showBackArrow: true,
       title: Text('Back', style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
              maxWidth: 800),
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 50),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Semantics(
                  child: Text(
                    'Privacy Policy',
                  style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: ATSizes.spaceBtwSections),
                Semantics(
                  child: Text(
                    privacypolicycontent,
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
          Get.toNamed('/'); 
        },
        child:  Icon(Iconsax.home),
        backgroundColor: ATColors.primaryColor
      ),
    );
  }
}
