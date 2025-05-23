// ignore_for_file: unused_element

import 'dart:async';
import 'package:flutter/material.dart';
import '../content/scrolling_features_content.dart';
import '../scrolling_features_desktop.dart';

class AutoScrollFeaturesDesktop extends StatefulWidget {
  final List<ScrollingFeaturesContent> features;

  const AutoScrollFeaturesDesktop({super.key, required this.features});

  @override
  State<AutoScrollFeaturesDesktop> createState() => _AutoScrollFeaturesDesktopState();
}

class _AutoScrollFeaturesDesktopState extends State<AutoScrollFeaturesDesktop> {
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
    _scrollTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      if (!_isHovered) {
        _scrollOffset += 320; // width of item + spacing
        if (_scrollOffset > _scrollController.position.maxScrollExtent) {
          _scrollOffset = 0.0;
        }
        _scrollController.animateTo(
          _scrollOffset,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _stopAutoScroll() {
    _scrollTimer.cancel();
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
        height: 250,
        child: ListView.separated(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.features.length,
          itemBuilder: (context, index) {
            return ScrollingFeaturesDesktop(feature: widget.features[index]);
          },
          separatorBuilder: (context, index) => const SizedBox(width: 20),
        ),
      ),
    );
  }
}
