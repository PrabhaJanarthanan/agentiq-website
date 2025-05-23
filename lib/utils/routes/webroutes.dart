import 'package:get/get.dart';

import '../../pages/homepage/homepage.dart';

final getPages = [
  GetPage(name: '/', page: () => HomePage()),
  GetPage(name: '/features', page: () => HomePage()),
  GetPage(name: '/contact', page: () => HomePage()),
];
