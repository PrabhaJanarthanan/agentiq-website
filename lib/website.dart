
import 'package:agentiqthingswebsite/pages/homepage/homepage.dart';
import 'package:flutter/material.dart';

import 'utils/routes/webroutes.dart';
import 'utils/theme/theme.dart';
import 'package:get/get.dart';

class Website extends StatelessWidget {
  const Website({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      theme: ATWebsiteTheme.lightTheme,
      title: 'Agentiq-Things',
      darkTheme: ATWebsiteTheme.darkTheme,
      getPages: getPages,
     // initialBinding: GeneralBindings(),
      debugShowCheckedModeBanner: false,
      //initialRoute: '/',
      home: Scaffold(
        body: HomePage(),
    ));
    
  }
}