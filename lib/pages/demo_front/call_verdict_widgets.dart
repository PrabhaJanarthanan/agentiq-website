import 'package:agentiq/agentiq.dart';
import 'package:agentiqthingswebsite/controller/demo_page_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallResultWidget extends StatelessWidget {
  CallResultWidget({super.key});
  final controller = Get.find<MainPageController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            // Obx(() => controller.isVerdictAvailable.value
            //     ? CallVerdictWidget()
            //     : Container()),
            if (controller.isVerdictAvailable.value) CallVerdictWidget(),
            ...controller.callTranscript.value.entries.map((entry) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ListTile(
                  title: TextField(
                    maxLines: 3,
                    readOnly: true,
                    controller: TextEditingController(
                      text:
                          "${entry.value.entries.first.key}:${entry.value.entries.first.value.toString()}",
                    ),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  subtitle: AutoSizeText(entry.key, minFontSize: 10),
                ),
              );
            }).toList()
          ]),
        ),
      ),
    );
  }
}

class CallVerdictWidget extends StatelessWidget {
  CallVerdictWidget({super.key});
  final controller = Get.find<MainPageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: TextField(
              maxLines: 3,
              readOnly: true,
              controller:
                  TextEditingController(text: controller.callVerdict.value),
            ),
          ),
          Obx(
            () => controller.isCallRecordingAvailable.value
                ? Expanded(
                    flex: 1,
                    child: Center(
                      child: IconButton.filled(
                        tooltip: "Play/Pause Call Recording",
                        onPressed: () async {
                          if (controller.isRecordingPlaying.value) {
                            controller.isRecordingPlaying.value = false;
                            controller.isRecordingPlaying.refresh();
                            await controller.stopPlayingCallRecording();
                          } else {
                            controller.isRecordingPlaying.value = true;
                            controller.isRecordingPlaying.refresh();
                            await controller.playCallRecording();
                          }
                        },
                        icon: Obx(() => controller.isRecordingPlaying.value
                            ? Icon(Icons.pause)
                            : Icon(Icons.play_arrow)),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.deepPurple.shade100,
                          foregroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class CallInstructionsWidget extends StatelessWidget {
  const CallInstructionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: AutoSizeText(
            """
        *** To check the ability of the AI, please enter your email and whatsapp number,
        You can ask the AI to communicate with you thru email and whatsapp, 
        You can ask the AI to answer your queries which you send to it via email
        """,
            minFontSize: 10,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ));
  }
}
