import 'package:agentiqthingswebsite/pages/footer/footer_mobile.dart';
import 'package:agentiqthingswebsite/pages/main_frontpage/frontpage_mobile.dart';
import 'package:agentiqthingswebsite/pages/scrolling_features/auto_scroll_widgets/auto_scroll_features_mobile.dart';
import 'package:agentiqthingswebsite/pages/scrolling_features/content/scrolling_features_content.dart';
import 'package:agentiqthingswebsite/utils/constants/colors.dart';
import 'package:agentiqthingswebsite/utils/navbar/mobile_navbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import '../demo_front/agentiq_lab_widget.dart';

class HomePageMobile extends StatefulWidget {
  final ScrollController scrollController;
  final GlobalKey homeKey;
  final GlobalKey contactKey;
  final GlobalKey featuresKey;
  final VoidCallback scrollToHome;
  final VoidCallback scrollToFeatures;
  final VoidCallback scrollToContact;
  final Function(int) onNavItemTap;

  const HomePageMobile({super.key, 
  required this.scrollController, 
  required this.homeKey, 
  required this.contactKey, 
  required this.featuresKey, 
  required this.scrollToHome, 
  required this.scrollToFeatures, 
  required this.scrollToContact, 
  required this.onNavItemTap});

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> 
with SingleTickerProviderStateMixin
{

  late AnimationController _controller;
  bool _isHomeFabVisible = false;

    @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);
    widget.scrollController.addListener(_scrollListener);
  }

  void _scrollListener(){
    if(!mounted) return;

    if(widget.scrollController.position.pixels > 100){
      if(!_isHomeFabVisible){
        setState(() {
          _isHomeFabVisible = true;
        });
      }
    } else {
      if(_isHomeFabVisible){
        setState(() {
          _isHomeFabVisible = false;
        });
      }
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  void _openWhatsApp() async {
    final String whatsappNumber = "+919488501457";
    final String message = "Hello, I have a query regarding your services.";
    final Uri whatsappUri  = Uri.parse("https://wa.me/$whatsappNumber?text=${Uri.encodeComponent(message)}");

    if(await canLaunchUrl(whatsappUri)){
      await launchUrl(whatsappUri);
    } else {
      debugPrint("Oops!, Couldn't Open WhatsApp");
    }
  }
  @override
  Widget build(BuildContext context) {
     final dark = ATHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Column(
        children: [
          MobileNavbar(
            scrollToHome: widget.scrollToHome,
            scrollToContact: widget.scrollToContact,
            scrollToFeatures: widget.scrollToFeatures,
            onNavItemTap: widget.onNavItemTap,
            
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: widget.scrollController,
              child: Column(
                children: [
                  AgentiqLabWidgetMobile(),
                  Container(key: widget.homeKey, child: FrontPageMobile(bulletText: true)),
                  SizedBox(height: ATSizes.spaceBtwSections),
                  Container(key: widget.featuresKey, child: AutoScrollFeaturesMobile(features: scrollingFeaturesUtils)),
                  SizedBox(height: ATSizes.spaceBtwSections),
                  Container(key: widget.contactKey, child: FooterMobile()),
                ],
              ),
            ),
          ),
        ],
        
      ),
      floatingActionButton: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            right: _isHomeFabVisible ? 16 : -90,
            bottom: 100,
            child: AnimatedOpacity(
              opacity: _isHomeFabVisible ? 1.0 : 0.0, 
              duration: Duration(milliseconds: 200),
              child: RawMaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20)
                ),
              ),
                onPressed: widget.scrollToHome,
                fillColor: ATColors.primaryColor,
                child: Icon(Iconsax.arrow_up_2),),
              ), 
              ),
        
        
        Positioned(
          right: 10,
          bottom: 10,
          child: ScaleTransition(
            
            scale: Tween(
              begin: 1.0,
              end: 1.2).animate(
                CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
              ),
            
            child: FloatingActionButton(
              backgroundColor: dark ? Colors.transparent : ATColors.white,
              onPressed: _openWhatsApp,
              child: Image.asset(ATImages.whatsApp,
                        width: ATSizes.iconMd,
                        height: ATSizes.iconMd),
            ),
          ),
        ),
        ],
      ),
      
    );
  }
}