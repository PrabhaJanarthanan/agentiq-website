import 'package:agentiq/agentiq.dart';
import 'package:agentiqthingswebsite/controller/demo_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AgentiqLabWidgetDesktop extends StatelessWidget {
  AgentiqLabWidgetDesktop({super.key});
  final controller = Get.put(MainPageController());
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text("AgentIQ Lab", style: TextStyle(color: Colors.deepPurple)),
        initiallyExpanded: true,
        children: [
          SizedBox(
              height: getHeight(context, percent: 40),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: TextField(
                        maxLength: 1000,
                        maxLines: 20,
                        controller: controller.promptTextController,
                      )),
                  Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(flex: 1, child: CountryDropDown()),
                                Expanded(flex: 1, child: LanguageDropDown()),
                                Expanded(flex: 1, child: VoiceDropDown()),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              spacing: 10,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: TextField(
                                    maxLength: 100,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText:
                                          "Your EmailId To Test Your Prompt",
                                    ),
                                    controller: controller.emailTextController,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Tooltip(
                                    message:
                                        "ex: 919999999999 with country code",
                                    child: TextField(
                                      maxLines: 1,
                                      maxLength: 20,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText:
                                            "Whatsapp# To Test Your Prompt",
                                      ),
                                      controller: controller
                                          .whatsappNumberTextController,
                                    ),
                                  ),
                                ),
                                // Expanded(
                                //   flex: 1,
                                //   child: Obx(
                                //     () => controller.isEmailUpdating.value
                                //         ? Center(
                                //             child: CircularProgressIndicator())
                                //         : IconButton(
                                //             icon: Icon(Icons.send_outlined),
                                //             onPressed: () async {
                                //               await controller.updateEmailId();
                                //             },
                                //           ),
                                //   ),
                                // ),
                              ],
                            ),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       flex: 3,
                            //       child: Tooltip(
                            //         message:
                            //             "ex: 919999999999 with country code",
                            //         child: TextField(
                            //           maxLines: 1,
                            //           maxLength: 20,
                            //           decoration: InputDecoration(
                            //             border: OutlineInputBorder(),
                            //             labelText:
                            //                 "Whatsapp# To Test Your Prompt",
                            //           ),
                            //           controller: controller
                            //               .whatsappNumberTextController,
                            //         ),
                            //       ),
                            //     ),
                            //     Expanded(
                            //       flex: 1,
                            //       child: Obx(
                            //         () => controller.isWpNumUpdating.value
                            //             ? Center(
                            //                 child: CircularProgressIndicator())
                            //             : IconButton(
                            //                 icon: Icon(Icons.send_outlined),
                            //                 onPressed: () async {
                            //                   await controller.updateWpNum();
                            //                 },
                            //               ),
                            //       ),
                            //     )
                            //   ],
                            // ),
                            ElevatedButton(
                                onPressed: () async {
                                  if (!controller.isWebRtcSession.value) {
                                    await controller.connectWebRtc();
                                  } else {
                                    await controller.disconnectWebRtc();
                                  }
                                },
                                child: Stack(
                                  children: [
                                    Obx(
                                      () => controller.isWebRtcSession.value
                                          ? Text("End Call")
                                          : Text(
                                              maxLines: 1,
                                              "Talk to Agent",
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context).textTheme.labelMedium
                                            ),
                                    ),
                                    RTCWidget(),
                                  ],
                                )

                                // Text("Run")
                                )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: Obx(() => !controller.isWebRtcSession.value
                          ? Obx(() => controller.isVerdictAvailable.value
                              ? CallResultWidget()
                              : CallInstructionsWidget())
                          : Center(child: LinearProgressIndicator()))),
                ],
              )),
        ]);
  }
}

class CountryDropDown extends StatelessWidget {
  CountryDropDown({super.key});
  final controller = Get.put(MainPageController());
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Obx(
          () => Tooltip(
            message: "Select Country",
            child: DropdownButton<String>(
              isExpanded: true,
              value: controller.selectedLnCountryCode.value,
              menuMaxHeight: getHeight(context, percent: 40),
              icon: Icon(Icons.arrow_drop_down, color: Colors.deepPurple),
              items: speechLocalesMap.keys
                  .map(
                    (countryCode) => DropdownMenuItem<String>(
                      value: countryCode,
                      child: Text(
                        countryCode,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelMedium
                       // style: TextStyle(fontSize: 16),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                controller.setLnCountryCode(value!);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class LanguageDropDown extends StatelessWidget {
  LanguageDropDown({super.key});
  final controller = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Obx(
          () => Tooltip(
            message: "Select Language",
            child: DropdownButton<String>(
              value: controller.selectedLnCode.value,
              isExpanded: true,
              icon: Icon(Icons.arrow_drop_down, color: Colors.deepPurple),
              items: speechLocalesMap[controller.selectedLnCountryCode.value]!
                  .entries
                  .map(
                    (entry) => DropdownMenuItem<String>(
                      value: entry.value,
                      child: Text(entry.key, style: Theme.of(context).textTheme.labelMedium),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                controller.setLnCode(value!);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class VoiceDropDown extends StatelessWidget {
  VoiceDropDown({super.key});
  final controller = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Obx(
          () => Tooltip(
            message: "Select Voice",
            child: DropdownButton<String>(
              hint: Text("Select Voice"),
              value: controller.selectedVoice.value,
              isExpanded: true,
              icon: Icon(Icons.arrow_drop_down, color: Colors.deepPurple),
              items: controller
                  .voiceOptions
                  .value
                  // voices[controller.selectedLnCode.value]!
                  .entries
                  .map(
                    (entry) => DropdownMenuItem<String>(
                      value: entry.value,
                      child: Text(entry.key, style: Theme.of(context).textTheme.labelMedium),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                controller.selectedVoice.value = value!;
                controller.selectedVoice.refresh();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class NewCampaignLanguageControlsWidget extends StatelessWidget {
  NewCampaignLanguageControlsWidget({super.key});
  final controller = Get.put(MainPageController());
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Select CountryCode
        Expanded(
          flex: 2,
          child: DropdownButtonHideUnderline(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Obx(
                () => DropdownButton<String>(
                  isExpanded: true,
                  value: controller.selectedLnCountryCode.value,
                  menuMaxHeight: getHeight(context, percent: 40),
                  icon: Icon(Icons.arrow_drop_down, color: Colors.deepPurple),
                  items: speechLocalesMap.keys
                      .map(
                        (countryCode) => DropdownMenuItem<String>(
                          value: countryCode,
                          child: Text(
                            countryCode,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelMedium
                            //style: TextStyle(fontSize: 16),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    controller.setLnCountryCode(value!);
                  },
                ),
              ),
            ),
          ),
        ),

        /// Select Language
        Expanded(
          flex: 2,
          child: DropdownButtonHideUnderline(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Obx(
                () => DropdownButton<String>(
                  value: controller.selectedLnCode.value,
                  isExpanded: true,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.deepPurple),
                  items:
                      speechLocalesMap[controller.selectedLnCountryCode.value]!
                          .entries
                          .map(
                            (entry) => DropdownMenuItem<String>(
                              value: entry.value,
                              child: Text(entry.key, style: Theme.of(context).textTheme.labelMedium),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {},
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

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
            Obx(() => controller.isVerdictAvailable.value
                ? CallVerdictWidget()
                : Container()),

            ...controller.callTranscript.value.entries.map((entry) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ListTile(
                  title: Text(
                      "${entry.value.entries.first.key}:${entry.value.entries.first.value.toString()}",
                      style: Theme.of(context).textTheme.labelMedium,),
                  subtitle: Text(entry.key),
                ),
              );
            }).toList()
            // Container(
            //   height: double.infinity,
            //   child: SingleChildScrollView(
            //     child: Column(
            //         children:
            //        ),
            //   ),
            // ),
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
      height: getHeight(context, percent: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: ListTile(
        title: Text(controller.callVerdict.value),
        subtitle: Obx(
          () => !controller.isCallRecordingAvailable.value
              ? Container()
              : IconButton.filled(
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
                      : Icon(Icons.play_arrow))),
        ),
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
          child: Text("""
        *** To check the ability of the AI, please enter your email and whatsapp number,
        You can ask the AI to communicate with you thru email and whatsapp, 
        You can ask the AI to answer your queries which you send to it via email
        """,
          style: Theme.of(context).textTheme.labelMedium,),
        ));
  }
}

///////////////============== Mobile View ===============///////////////
class AgentiqLabWidgetMobile extends StatelessWidget {
  AgentiqLabWidgetMobile({super.key});
  final controller = Get.put(MainPageController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ExpansionTile(
          title:
              Text("AgentIQ Lab", style: TextStyle(color: Colors.deepPurple)),
          initiallyExpanded: true,
          children: [
            SizedBox(
                height: getHeight(context, percent: 70),
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Obx(() => !controller.isWebRtcSession.value &&
                                !controller.isVerdictAvailable.value
                            ? TextField(
                                maxLength: 1000,
                                maxLines: 20,
                                controller: controller.promptTextController,
                              )
                            : Obx(
                                () => controller.isVerdictAvailable.value
                                    ? CallResultWidget()
                                    : Center(child: LinearProgressIndicator()),
                              ))),
                    Expanded(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                spacing: 10,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(flex: 1, child: CountryDropDown()),
                                  Expanded(flex: 1, child: LanguageDropDown()),
                                  Expanded(flex: 1, child: VoiceDropDown()),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                spacing: 10,
                                children: [
                                  Expanded(
                                    //flex: 3,
                                    child: TextField(
                                      // maxLength: 100,
                                      // maxLines: 1,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText:
                                            "Your EmailId To Test Your Prompt",
                                      ),
                                      controller:
                                          controller.emailTextController,
                                    ),
                                  ),
                                  Expanded(
                                    //flex: 3,
                                    child: Tooltip(
                                      message:
                                          "ex: 919999999999 with country code",
                                      child: TextField(
                                       // maxLines: 1,
                                       // maxLength: 20,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText:
                                              "Whatsapp# To Test Your Prompt",
                                        ),
                                        controller: controller
                                            .whatsappNumberTextController,
                                      ),
                                    ),
                                  ),
                                  // Expanded(
                                  //   flex: 1,
                                  //   child: Obx(
                                  //     () => controller.isEmailUpdating.value
                                  //         ? Center(
                                  //             child: CircularProgressIndicator())
                                  //         : IconButton(
                                  //             icon: Icon(Icons.send_outlined),
                                  //             onPressed: () async {
                                  //               await controller.updateEmailId();
                                  //             },
                                  //           ),
                                  //   ),
                                  // ),
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     Expanded(
                              //       flex: 3,
                              //       child: Tooltip(
                              //         message:
                              //             "ex: 919999999999 with country code",
                              //         child: TextField(
                              //           maxLines: 1,
                              //           maxLength: 20,
                              //           decoration: InputDecoration(
                              //             border: OutlineInputBorder(),
                              //             labelText:
                              //                 "Whatsapp# To Test Your Prompt",
                              //           ),
                              //           controller: controller
                              //               .whatsappNumberTextController,
                              //         ),
                              //       ),
                              //     ),
                              //     Expanded(
                              //       flex: 1,
                              //       child: Obx(
                              //         () => controller.isWpNumUpdating.value
                              //             ? Center(
                              //                 child: CircularProgressIndicator())
                              //             : IconButton(
                              //                 icon: Icon(Icons.send_outlined),
                              //                 onPressed: () async {
                              //                   await controller.updateWpNum();
                              //                 },
                              //               ),
                              //       ),
                              //     )
                              //   ],
                              // ),
                              ElevatedButton(
                                  onPressed: () async {
                                    if (!controller.isWebRtcSession.value) {
                                      await controller.connectWebRtc();
                                    } else {
                                      await controller.disconnectWebRtc();
                                    }
                                  },
                                  child: Stack(
                                    children: [
                                      Obx(
                                        () => controller.isWebRtcSession.value
                                            ? Text("End Call")
                                            : Text(
                                                maxLines: 1,
                                                "Talk to Agent",
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context).textTheme.labelMedium,
                                              ),
                                      ),
                                      RTCWidget(),
                                    ],
                                  )

                                  // Text("Run")
                                  )
                            ],
                          ),
                        )),
                  ],
                )),
          ]),
    );
  }
}
