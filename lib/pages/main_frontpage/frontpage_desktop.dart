import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class FrontPageDesktop extends StatefulWidget {
  const FrontPageDesktop({super.key});

  @override
  State<FrontPageDesktop> createState() => _FrontPageDesktopState();
}

class _FrontPageDesktopState extends State<FrontPageDesktop>
with TickerProviderStateMixin {
  late AnimationController _controller;
  // ignore: unused_field
  late Animation<double> _textAnimation;

  bool showText = false;

  @override
  void initState(){
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _textAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        showText = true;
      });
    });
  }

  @override 
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ATSizes.defaultSpace),
      child: Column(
        children: [
          Center(
            child: Semantics(
              label: 'Botify AI slogan: Botify - AI That Gets Things Done in 24 Hours',
              header: true,
              child: Text(
                '“Botify - AI That Gets Things Done in 24 Hours”',
                style: Theme.of(context).textTheme.headlineMedium
              ),
            ),

          ),
          SizedBox(height: ATSizes.spaceBtwSections),
          AnimatedOpacity(
            opacity: showText ? 1.0 : 0.0, 
            duration: Duration(milliseconds: 300),
            child: Semantics(
              label: "Botify product description",
              child: Text(
                 "Botify Anyone Work is your personal AI-powered assistant tailored to automate your communication and outreach needs—calls, emails, messaging, and more—all from a basic PC + Android phone setup.",
                 style: Theme.of(context).textTheme.headlineSmall,
                 textAlign: TextAlign.center,
              ),
            ),
          ),

        ],
      ),
    );
  }
}