import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../content/scrolling_features_content.dart';
import '../scrolling_features_mobile.dart';

class AutoScrollFeaturesMobile extends StatefulWidget {
  final List<ScrollingFeaturesContent> features;

  const AutoScrollFeaturesMobile({super.key, required this.features});

  @override
  State<AutoScrollFeaturesMobile> createState() => _AutoScrollFeaturesMobileState();
}

class _AutoScrollFeaturesMobileState extends State<AutoScrollFeaturesMobile> {
  final PageController _pageController = PageController();
  late Timer _scrollTimer;
  int _currentPage = 0;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _scrollTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!_isPaused) {
        _currentPage = (_currentPage + 1) % widget.features.length;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollTimer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _pauseScrolling() => setState(() => _isPaused = true);
  void _resumeScrolling() => setState(() => _isPaused = false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _pauseScrolling(),
      onTapUp: (_) => _resumeScrolling(),
      onLongPress: _pauseScrolling,
      onLongPressUp: _resumeScrolling,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Semantics(
             child: Text('Features',
             style: Theme.of(context).textTheme.headlineSmall),
           ),
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.features.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                return ScrollingFeaturesMobile(feature: widget.features[index]);
              },
            ),
          ),

           SizedBox(height: ATSizes.spaceBtwItems/2),

          /// dot indicator
          SmoothPageIndicator(
            controller: _pageController,
            count: widget.features.length,
            effect: ExpandingDotsEffect(
              activeDotColor:ATColors.primaryColor,
              dotHeight: 4,
              dotWidth: 4,
              spacing: 3,
            ),
          ),

        ],
      ),
    );
  }
}
