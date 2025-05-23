import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import 'content/scrolling_features_content.dart';

class ScrollingFeaturesTablet extends StatefulWidget {
  final ScrollingFeaturesContent feature;

  const ScrollingFeaturesTablet({required this.feature, Key? key}) : super(key: key);

  @override
  State<ScrollingFeaturesTablet> createState() => _ScrollingFeaturesTabletState();
}

class _ScrollingFeaturesTabletState extends State<ScrollingFeaturesTablet> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth * 0.4; 
    final double containerHeight = containerWidth;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: EdgeInsets.all(ATSizes.spacesBtwTexts),
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
         // color: isHovered ? Colors.white : Colors.transparent,
          gradient: isHovered
              ? LinearGradient(
                  colors: [ATColors.primaryColor, ATColors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(ATSizes.spaceBtwItems / 2),
              child: SizedBox(
                height: ATSizes.iconLg , 
                width: ATSizes.iconLg ,
                child: Semantics(
                  label: 'Icon representing ${widget.feature.title}',
                  child: Image.asset(
                    widget.feature.icon,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
           Padding(
              padding: EdgeInsets.symmetric(horizontal: ATSizes.spaceBtwItems),
              child: Semantics(
                header: true,
                label: 'Feature title: ${widget.feature.title}',
                child: Text(
                  widget.feature.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(ATSizes.spaceBtwItems / 2),
              child: Semantics(
                label: widget.feature.subtitle,
                child: Text(
                  widget.feature.subtitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
