import 'package:agentiq/helpers.dart';
import 'package:agentiqthingswebsite/controller/demo_page_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgentiqSampleCallsDesktop extends StatelessWidget {
  AgentiqSampleCallsDesktop({super.key});
  final controller = Get.find<MainPageController>();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: EdgeInsets.all(30),
      expandedCrossAxisAlignment: CrossAxisAlignment.center,
      title: const Text('Sample Calls'),
      children: [
        SizedBox(
          height: getHeight(context, percent: 20),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final itemWidth = 100.0;
              final crossAxisCount =
                  (getWidth(context, percent: 70) ~/ itemWidth).clamp(1, 10);
              return Center(
                child: Container(
                  width: crossAxisCount * itemWidth + (crossAxisCount - 1) * 20,
                  child: GridView.count(
                      dragStartBehavior: DragStartBehavior.start,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      crossAxisCount: crossAxisCount,
                      shrinkWrap: true,
                      children: const [
                        SampleCall(),
                        SampleCall(),
                        SampleCall(),
                        SampleCall(),
                        SampleCall(),
                        SampleCall(),
                        SampleCall(),
                        SampleCall(),
                        SampleCall(),
                        SampleCall()
                      ]),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class SampleCall extends StatelessWidget {
  const SampleCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
