import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/appbar/appbar.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import 'privacypolicy_content.dart';

class PrivacyPolicyTablet extends StatelessWidget {
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
          constraints: const BoxConstraints( maxWidth: 700),
              
          padding: const EdgeInsets.symmetric( vertical: 60, horizontal: 40),
              
          child:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Privacy Policy',
                  style: Theme.of(context).textTheme.headlineSmall
                ),
                SizedBox(height: ATSizes.spaceBtwSections), 
                Text(
                  privacypolicycontent,
                  style: Theme.of(context).textTheme.labelMedium,
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
        child: const Icon(Iconsax.home, color: ATColors.black,),
        backgroundColor: ATColors.primaryColor, 
      ),
    );
  }
}
