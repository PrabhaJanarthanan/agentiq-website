import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import 'content/scrolling_features_content.dart';

class ScrollingFeaturesMobile extends StatelessWidget {
  final ScrollingFeaturesContent feature;

  const ScrollingFeaturesMobile({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
     final dark = ATHelperFunctions.isDarkMode(context);
    return Container(
      margin: EdgeInsets.all(ATSizes.spaceBtwItems),
      padding: EdgeInsets.all(ATSizes.spaceBtwItems),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: dark ? ATColors.white : Colors.transparent),
        color: dark ? Colors.transparent : ATColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(feature.icon, height: ATSizes.iconLg, width: ATSizes.iconLg),
          const SizedBox(height: ATSizes.spacesBtwTexts),
          Semantics(
            header: true,
            label: 'Feature title: ${feature.title}',
            child: Text(
              feature.title,
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: ATSizes.spacesBtwTexts),
          Semantics(
            child: Text(
              feature.subtitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
