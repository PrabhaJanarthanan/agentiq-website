import 'package:agentiqthingswebsite/pages/footer/footer_tablet.dart';
import 'package:agentiqthingswebsite/pages/main_frontpage/frontpage_tablet.dart';
import 'package:agentiqthingswebsite/pages/scrolling_features/auto_scroll_widgets/auto_scroll_features_tablet.dart';
import 'package:agentiqthingswebsite/utils/navbar/tablet_navbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../scrolling_features/content/scrolling_features_content.dart';

class HomePageTablet extends StatefulWidget {
  final ScrollController scrollController;
  final GlobalKey homeKey;
  final GlobalKey contactKey;
  final GlobalKey featuresKey;
  final VoidCallback scrollToHome;
  final VoidCallback scrollToFeatures;
  final VoidCallback scrollToContact;

  const HomePageTablet({super.key, 
  required this.scrollController, 
  required this.homeKey, 
  required this.contactKey, 
  required this.featuresKey, 
  required this.scrollToHome, 
  required this.scrollToFeatures, 
  required this.scrollToContact});

  @override
  State<HomePageTablet> createState() => _HomePageTabletState();
}

class _HomePageTabletState extends State<HomePageTablet> 
with SingleTickerProviderStateMixin{
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
          TabletNavbar(
            scrollToHome: widget.scrollToHome,
            scrollToContact: widget.scrollToContact,
            scrollToFeatures: widget.scrollToFeatures,
            onNavItemTap: (index){},
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: widget.scrollController,
              child: Column(
                children: [
                  KeyedSubtree(key:widget.homeKey, child: FrontPageTablet(bulletText: true)),

                  SizedBox(height: ATSizes.spaceBtwSections),

                  KeyedSubtree(
                     key: widget.featuresKey,
                    child: AutoScrollFeaturesTablet(features: scrollingFeaturesUtils)),

                  SizedBox(height: ATSizes.spaceBtwSections),

                  KeyedSubtree(
                    key: widget.contactKey,
                    child: FooterTablet()),
                ],
              ),
            ),
          )
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
              opacity: _isHomeFabVisible ? 1.0 : 0.0, 
              duration: Duration(milliseconds: 200),
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
                scale:Tween(
                  begin: 1.0,
                  end: 1.2).animate(
                    CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
                  ),
                  child: FloatingActionButton(onPressed: _openWhatsApp,
                  child: Image.asset(ATImages.whatsApp,
                   width: ATSizes.iconMd,
                  height: ATSizes.iconMd,
                  ),
                  ),
                ), 
                ),
            
        ],
      ),
    );
  }
}