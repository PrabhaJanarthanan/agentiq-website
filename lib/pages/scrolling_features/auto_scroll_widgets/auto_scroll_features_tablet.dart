import 'dart:async';
import 'package:flutter/material.dart';
import '../content/scrolling_features_content.dart';
import '../scrolling_features_tablet.dart';

class AutoScrollFeaturesTablet extends StatefulWidget {
  final List<ScrollingFeaturesContent> features;

  const AutoScrollFeaturesTablet({super.key, required this.features});

  @override
  State<AutoScrollFeaturesTablet> createState() => _AutoScrollFeaturesTabletState();
}

class _AutoScrollFeaturesTabletState extends State<AutoScrollFeaturesTablet> {
  final ScrollController _scrollController = ScrollController();
  late Timer _scrollTimer;
  bool _isHovered = false;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _scrollTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!_isHovered) {
        _scrollOffset += 360; // More spacing for tablet
        if (_scrollOffset > _scrollController.position.maxScrollExtent) {
          _scrollOffset = 0.0;
        }
        _scrollController.animateTo(
          _scrollOffset,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollTimer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: SizedBox(
        height: 230, 
        child: ListView.separated(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.features.length,
          itemBuilder: (context, index) {
            return ScrollingFeaturesTablet(feature: widget.features[index]);
          },
          separatorBuilder: (context, index) => const SizedBox(width: 24),
        ),
      ),
    );
  }
}
