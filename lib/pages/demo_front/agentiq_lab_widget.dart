import 'package:agentiq/agentiq.dart';
import 'package:agentiqthingswebsite/controller/demo_page_controller.dart';
import 'package:agentiqthingswebsite/pages/demo_front/agentiq_lab_widgets.dart';
import 'package:agentiqthingswebsite/pages/demo_front/call_verdict_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';

class AgentiqLabWidgetDesktop extends StatelessWidget {
  AgentiqLabWidgetDesktop({super.key});
  final controller = Get.put(MainPageController());
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Center(
          child: Text("AgentIQ Studio",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: ATColors.primaryColor)),
        ),
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
                        maxLength: 2000,
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
                              Expanded(
                                  flex: 1,
                                  child: AutoSizeText(
                                    "Select Country",
                                    minFontSize: 10,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              Expanded(flex: 2, child: CountryDropDown()),
                            ],
                          ),
                          Row(
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: AutoSizeText("Select Language",
                                      overflow: TextOverflow.ellipsis,
                                      minFontSize: 10)),
                              Expanded(flex: 2, child: LanguageDropDown()),
                            ],
                          ),
                          Row(
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: AutoSizeText("Select Voice",
                                      overflow: TextOverflow.ellipsis,
                                      minFontSize: 10)),
                              Expanded(flex: 2, child: VoiceDropDown()),
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
                                  message: "ex: 919999999999 with country code",
                                  child: TextField(
                                    maxLines: 1,
                                    maxLength: 20,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText:
                                          "Whatsapp# To Test Your Prompt",
                                    ),
                                    controller:
                                        controller.whatsappNumberTextController,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                if (!controller.isWebRtcSession.value) {
                                  controller.isConnectionInProgress.value =
                                      true;
                                  controller.isConnectionInProgress.refresh();
                                  await controller.connectWebRtc();
                                  controller.isConnectionInProgress.value =
                                      false;
                                  controller.isConnectionInProgress.refresh();
                                } else {
                                  controller.isConnectionInProgress.value =
                                      true;
                                  controller.isConnectionInProgress.refresh();
                                  await controller.disconnectWebRtc();
                                  controller.isConnectionInProgress.value =
                                      false;
                                  controller.isConnectionInProgress.refresh();
                                }
                              },
                              child: Stack(
                                children: [
                                  Obx(
                                    () =>
                                        controller.isConnectionInProgress.value
                                            ? Center(
                                                child: SizedBox(
                                                    width: getWidth(context,
                                                        percent: 5),
                                                    child:
                                                        LinearProgressIndicator()),
                                              )
                                            : Obx(
                                                () => controller
                                                        .isWebRtcSession.value
                                                    ? AutoSizeText("End Call",
                                                        minFontSize: 10)
                                                    : AutoSizeText(
                                                        maxLines: 1,
                                                        minFontSize: 10,
                                                        "Talk to Agent",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium),
                                              ),
                                  ),
                                  RTCWidget(),
                                ],
                              )

                              // Text("Run")
                              )
                        ],
                      ),
                    ),
                  ),
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

///////////////============== Mobile View ===============///////////////
class AgentiqLabWidgetMobile extends StatelessWidget {
  AgentiqLabWidgetMobile({super.key});
  final controller = Get.put(MainPageController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ExpansionTile(
          title: AutoSizeText("AgentIQ Studio",
              minFontSize: 10,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: ATColors.primaryColor)),
          initiallyExpanded: true,
          children: [
            SizedBox(
                height: getHeight(context, percent: 75),
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
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                spacing: 10,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: AutoSizeText(
                                        "Select Country",
                                        minFontSize: 10,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                  Expanded(flex: 2, child: CountryDropDown()),
                                ],
                              ),
                              Row(
                                spacing: 10,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: AutoSizeText("Select Language",
                                          overflow: TextOverflow.ellipsis,
                                          minFontSize: 10)),
                                  Expanded(flex: 2, child: LanguageDropDown()),
                                ],
                              ),
                              Row(
                                spacing: 10,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: AutoSizeText("Select Voice",
                                          overflow: TextOverflow.ellipsis,
                                          minFontSize: 10)),
                                  Expanded(flex: 2, child: VoiceDropDown()),
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
                                ],
                              ),
                              ElevatedButton(
                                  onPressed: () async {
                                    if (!controller.isWebRtcSession.value) {
                                      await controller.connectWebRtc();
                                    } else {
                                      await controller.disconnectWebRtc();
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Stack(
                                      children: [
                                        Obx(
                                          () => controller.isWebRtcSession.value
                                              ? AutoSizeText("End Call",
                                                  minFontSize: 10,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium)
                                              : AutoSizeText(
                                                  maxLines: 1,
                                                  minFontSize: 10,
                                                  "Talk to Agent",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium,
                                                ),
                                        ),
                                        RTCWidget(),
                                      ],
                                    ),
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
