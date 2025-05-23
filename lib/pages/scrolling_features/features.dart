import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'content/scrolling_features_content.dart';
import 'scrolling_features_desktop.dart';
import 'scrolling_features_mobile.dart';
import 'scrolling_features_tablet.dart';


class ScrollingFeatures extends GetResponsiveView {
  final ScrollingFeaturesContent feature;

  ScrollingFeatures({required this.feature, super.key})
      : super(alwaysUseBuilder: false);

  @override
  Widget phone() => ScrollingFeaturesMobile(feature: feature);

  @override
  Widget desktop() => ScrollingFeaturesDesktop(
        feature: feature,
      );

  @override
  Widget tablet() => ScrollingFeaturesTablet(feature: feature);
}
