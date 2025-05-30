import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'refund_desktop.dart';
import 'refund_mobile.dart';
import 'refund_tablet.dart';



class RefundPage extends GetResponsiveView {
  RefundPage({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => RefundMobile();

  @override
  Widget desktop() => RefundDesktop();

  @override
  Widget tablet() => RefundTablet();
}
