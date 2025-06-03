import 'package:agentiq/agentiq.dart';
import 'package:agentiqthingswebsite/controller/demo_page_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              isDense: true,
              value: controller.selectedLnCountryCode.value,
              menuMaxHeight: getHeight(context, percent: 40),
              icon: Icon(Icons.arrow_drop_down, color: Colors.deepPurple),
              items: speechLocalesMap.keys
                  .map(
                    (countryCode) => DropdownMenuItem<String>(
                      value: countryCode,
                      child: AutoSizeText(countryCode,
                          minFontSize: 10,
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
              isDense: true,
              value: controller.selectedLnCode.value,
              isExpanded: true,
              icon: Icon(Icons.arrow_drop_down, color: Colors.deepPurple),
              items: speechLocalesMap[controller.selectedLnCountryCode.value]!
                  .entries
                  .map(
                    (entry) => DropdownMenuItem<String>(
                      value: entry.value,
                      child: AutoSizeText(entry.key,
                          minFontSize: 10,
                          style: Theme.of(context).textTheme.labelMedium),
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
              isDense: true,
              hint: AutoSizeText("Select Voice", minFontSize: 10),
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
                      child: AutoSizeText(entry.key,
                          minFontSize: 10,
                          style: Theme.of(context).textTheme.labelMedium),
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
