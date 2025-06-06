import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../controller/scroll_redirect_controller.dart';
import 'home_desktop.dart';
import 'home_mobile.dart';
import 'home_tablet.dart';

class HomePage extends GetResponsiveView {
  final controller = Get.put(ScrollRedirectController());
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _featuresKey = GlobalKey();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();


  HomePage( {Key? key}) : super(key: key);

  

  void scrollToHome(){
    final context = _homeKey.currentContext;
    if(context != null){
      Scrollable.ensureVisible(context, duration: Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  void scrollToFeatures(){
       final context = _featuresKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }


  void scrollToContact() {
    final context = _contactKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  void onNavItemTap(int index){
    if (Get.currentRoute != '/') {

    if(index == 0){
      Get.toNamed('/home');
    } else if(index == 1){
      Get.toNamed('/features');
    } else if(index == 2){
      Get.toNamed('/contact');
    }

  Future.delayed(const Duration(milliseconds: 1000), () {
    // if (Get.currentRoute != '/') {
    //   Get.offAllNamed('/');
    // }
    switch (index){
      case 0: scrollToHome(); break;
      case 1: scrollToFeatures(); break;
      case 2: scrollToContact(); break;
    }
  });
  } else {
      switch (index){
        case 0: scrollToHome(); break;
        case 1: scrollToFeatures(); break;
        case 2: scrollToContact(); break;
      }
    }
  }
    @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
       final currentRoute = Get.currentRoute;
      if (currentRoute == '/features' ) {
        scrollToFeatures();
      } else if (currentRoute == '/contact'  ) {
        scrollToContact();
      } else if (currentRoute == '/home' ) {
        scrollToHome();
      }
    });

    return super.build(context);
  }

  @override
  Widget phone() =>  HomePageMobile(
    scrollController: _scrollController,
    contactKey: _contactKey,
    featuresKey: _featuresKey,
    homeKey: _homeKey,
    scrollToHome: scrollToHome,
    scrollToFeatures: scrollToFeatures,
    scrollToContact: scrollToContact,
    onNavItemTap: onNavItemTap,

  );

  @override
  Widget desktop() =>  HomePageDesktop(
    featuresKey: _featuresKey,
    contactKey: _contactKey,
    homeKey: _homeKey,
    scrollController: _scrollController,
    scrollToHome: scrollToHome,
    scrollToContact: scrollToContact,
    scrollToFeatures: scrollToFeatures,
    );

  @override
  Widget tablet() =>  HomePageTablet(
    featuresKey: _featuresKey,
    contactKey: _contactKey,
    homeKey: _homeKey,
    scrollController: _scrollController,
    scrollToHome: scrollToHome,
    scrollToContact: scrollToContact,
    scrollToFeatures: scrollToFeatures,
  );
}
