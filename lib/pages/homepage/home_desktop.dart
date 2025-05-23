import 'package:agentiqthingswebsite/pages/botify_description/botify_desktop.dart';
import 'package:agentiqthingswebsite/pages/footer/footer_desktop.dart';
import 'package:agentiqthingswebsite/pages/main_frontpage/frontpage_desktop.dart';
import 'package:agentiqthingswebsite/utils/constants/colors.dart';
import 'package:agentiqthingswebsite/utils/constants/image_strings.dart';
import 'package:agentiqthingswebsite/utils/navbar/desktop_navbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constants/sizes.dart';
import '../scrolling_features/auto_scroll_widgets/auto_scroll_features_desktop.dart';
import '../scrolling_features/content/scrolling_features_content.dart';

class HomePageDesktop extends StatefulWidget {
  final ScrollController scrollController;
  final GlobalKey homeKey;
  final GlobalKey contactKey;
  final GlobalKey featuresKey;
  final VoidCallback scrollToHome;
  final VoidCallback scrollToFeatures;
  final VoidCallback scrollToContact;

  const HomePageDesktop({super.key, 
  required this.featuresKey, 
  required this.scrollController, 
  required this.scrollToHome, 
  required this.scrollToFeatures, 
  required this.scrollToContact, 
   required this.homeKey, 
   required this.contactKey});

  @override
  State<HomePageDesktop> createState() => _HomePageDesktopState();
}

class _HomePageDesktopState extends State<HomePageDesktop>
with SingleTickerProviderStateMixin {
  
  late AnimationController _controller;
  bool _isHomeFabVisible = false;

  @override
  void initState(){
    super.initState();
    _controller = AnimationController(vsync: this,
    duration: Duration(milliseconds: 800),
    )..repeat(reverse: true);

    widget.scrollController.addListener((){
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
    });

  }

  @override 
  void dispose(){
    widget.scrollController.removeListener((){});
    _controller.dispose();
    super.dispose();
  }

  void _openWhatsApp() async {
    final String whatsappNumber = "+919488501457";
    final String message = "Hello, Want to know more about this";
    final Uri whatsappUri = Uri.parse("https://wa.me/$whatsappNumber?text=${Uri.encodeComponent(message)}",
    );
    if (await canLaunchUrl(whatsappUri)){
      await launchUrl(whatsappUri);
    } else {
      debugPrint("Oops!, Couldn't Open WhatsApp");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      children: [
        DesktopNavbar(
          scrollToHome: widget.scrollToHome,
          scrollToContact: widget.scrollToContact,
          scrollToFeatures: widget.scrollToFeatures,
          onNavItemTap: (index){},
        ),
       // SizedBox(height: ATSizes.spaceBtwSections),
        Expanded(
          
          child: SingleChildScrollView(
            controller: widget.scrollController,
            padding: EdgeInsets.only(right: ATSizes.spaceBtwSections*2, left: ATSizes.spaceBtwSections*2),
            child: Column(
            children: [
              KeyedSubtree(
                key: widget.homeKey,
                child: FrontPageDesktop()),
              SizedBox(height: ATSizes.spaceBtwSections),
              BotifyDesktop(),
              SizedBox(height: ATSizes.spaceBtwSections),
              KeyedSubtree(
                key: widget.featuresKey,
                child: AutoScrollFeaturesDesktop(features: scrollingFeaturesUtils)),
              SizedBox(height: ATSizes.spaceBtwSections),
              KeyedSubtree(
                key: widget.contactKey,
                child: FooterDesktop()),

            ],
          )),
        ),
     
        
      ],
      ),
      floatingActionButton: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(microseconds: 300),
            curve: Curves.easeInOut,
            right: _isHomeFabVisible ? 16 : -90,
            bottom: 100,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: _isHomeFabVisible ? 1.0 : 0.0,
              child: RawMaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                  ),
                ),
                onPressed: widget.scrollToHome,
                fillColor: ATColors.primaryColor,
                child: Icon(Iconsax.arrow_square_up),), 
              ), 
            ),

            //Whatsapp FAB
            Positioned(
              right: 10,
              bottom: 10,
              child: ScaleTransition(
                scale: Tween(begin: 1.0, end: 1.2).animate(
                  CurvedAnimation(
                    parent: _controller, 
                    curve: Curves.easeInOut),
                ),
                child: FloatingActionButton(
                  onPressed: _openWhatsApp,
                 // backgroundColor: Colors.transparent,
                  child: Image.asset(ATImages.whatsApp,
                  width: ATSizes.iconLg,
                  height: ATSizes.iconLg),),
              ),
              
            ),
        ],
      ),
    );
  }
}