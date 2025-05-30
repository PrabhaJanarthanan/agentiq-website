import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart'; 
import 'website.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const Website());
}
