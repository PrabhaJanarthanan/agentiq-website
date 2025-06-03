import 'dart:async';
import 'dart:convert';
import 'package:agentiq/agentiq.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../pages/demo_front/language_voices.dart';

const serverUrl = "https://2604-13-60-50-79.ngrok-free.app";
const baseUrl = "$serverUrl/api/";

class MainPageController extends GetxController {
  void onInit() {
    super.onInit();
    promptTextController.text = agentiqPrompt;
  }

  final RxString selectedLnCountryCode = "American".obs;
  final voiceOptions = Rx<Map<String, String>>(voices["en-US"]!);
  final dio = Dio();
  void setLnCountryCode(String countryCode) {
    selectedLnCountryCode.value = countryCode;
    selectedLnCode.value = speechLocalesMap[countryCode]!.values.first;
    selectedLnCode.refresh();
    voiceOptions.value = voices[speechLocalesMap[countryCode]!.values.first]!;
    voiceOptions.refresh();
    selectedVoice.value = voiceOptions.value.entries.first.value;
    selectedVoice.refresh();
  }

  void setLnCode(String code) {
    selectedLnCode.value = code;
    selectedLnCode.refresh();
    voiceOptions.value = voices[code]!;
    voiceOptions.refresh();
    selectedVoice.value = voiceOptions.value.entries.first.value;
    selectedVoice.refresh();
  }

  final signalingUrl = "${baseUrl}offer";
  final udpateWpNumUrl = "${baseUrl}data/update-session-wp-num";
  final updateEmailUrl = "${baseUrl}data/update-session-email";
  final updatePromptUrl = "${baseUrl}data/update-session-prompt";
  final getCallRecordingUrl = "${baseUrl}data/fetch-recording";
  final getCallTranscriptUrl = "${baseUrl}data/fetch-transcript";
  final getVerdictUrl = "${baseUrl}data/fetch-verdict";

  final emailTextController = TextEditingController();
  final whatsappNumberTextController = TextEditingController();
  final promptTextController = TextEditingController();
  String? token;
  WebRTCClient? webRtcClient;
  bool isWebRtcClientDisconnected = false;
  final callTranscript = Rx<Map<String, Map<String, dynamic>>>({});

  Timer? timer;
  final RxBool isCallRecordingAvailable = false.obs;
  final RxBool isVerdictAvailable = false.obs;
  final RxBool isCallTranscriptAvailable = false.obs;
  final RxString callRecordingFileUrl = "".obs;
  final RxString callVerdict = "".obs;
  final RxString selectedLnCode = "en-US".obs;
  final RxString selectedVoice = "en-US-JennyNeural".obs;
  final RxBool isWebRtcSession = false.obs;
  final RxBool isWpNumUpdating = false.obs;
  final RxBool isPromptUpdating = false.obs;
  final RxBool isEmailUpdating = false.obs;
  final RxBool isRecordingPlaying = false.obs;
  final audioPlayer = AudioPlayer();

  Future<void> connectWebRtc() async {
    if (!isWebRtcSession.value) {
      if (!emailTextController.text.isEmail ||
          !whatsappNumberTextController.text.isNumericOnly) {
        Get.defaultDialog(
            title: "Error",
            content: Text("Please enter valid email or phone number"));
        return;
      }

      isVerdictAvailable.value = false;
      isVerdictAvailable.refresh();
      callVerdict.value = "";
      callVerdict.refresh();

      token = DateTime.now().toIso8601String();
      webRtcClient = WebRTCClient(
        signalingUrl: signalingUrl,
        token: token,
        data: {
          "token": token,
          "email": emailTextController.text,
          "whatsapp_num": whatsappNumberTextController.text,
          "prompt": promptTextController.text
              .replaceAll("Edit this text to match your business process", ""),
          "language": selectedLnCode.value,
          "voice": selectedVoice.value
        },
      );
      await webRtcClient?.connect();
      isWebRtcSession.value = true;
      isWebRtcSession.refresh();
    }
  }

  Future<void> disconnectWebRtc() async {
    if (isWebRtcSession.value) {
      await webRtcClient?.dispose();
      isWebRtcSession.value = false;
      isWebRtcSession.refresh();
      if (token != null) {
        startCallResultsMonitor(token!);
      }
    }
  }

  Future<void> updateWpNum() async {
    isWpNumUpdating.value = true;
    isWpNumUpdating.refresh();
    try {
      final res = await dio.post(udpateWpNumUrl, data: {
        "token": token,
        "whatsapp_number": whatsappNumberTextController.text
      });
      if (!res.data["success"]) {
        Get.defaultDialog(
            title: "Error",
            content: Text(
                "Failed to update whatsapp number, Please refresh the page and try again"));
      } else {
        Get.snackbar("Success", "Whatsapp Number updated successfully");
      }
    } catch (e) {
      Get.defaultDialog(
          title: "Error",
          content: Text(
              "Failed to update whatsapp number, Please refresh the page and try again"));
    }
    isWpNumUpdating.value = false;
    isWpNumUpdating.refresh();
  }

  Future<void> updateEmailId() async {
    isEmailUpdating.value = true;
    isEmailUpdating.refresh();
    try {
      final res = await dio.post(updateEmailUrl,
          data: {"token": token, "email": emailTextController.text});
      if (!res.data["success"]) {
        Get.defaultDialog(
            title: "Error",
            content: Text(
                "Failed to update email id, Please refresh the page and try again"));
      } else {
        Get.snackbar("Success", "Email Id updated successfully");
      }
    } catch (e) {
      Get.defaultDialog(
          title: "Error",
          content: Text(
              "Failed to update email id, Please refresh the page and try again"));
    }
    isEmailUpdating.value = false;
    isEmailUpdating.refresh();
  }

  Future<void> updatePrompt() async {
    isPromptUpdating.value = true;
    isPromptUpdating.refresh();
    try {
      final res = await dio.post(updatePromptUrl,
          data: {"token": token, "prompt": promptTextController.text});
      if (!res.data["success"]) {
        Get.defaultDialog(
            title: "Error",
            content: Text(
                "Failed to update prompt, Please refresh the page and try again"));
      } else {
        Get.snackbar("Success", "Prompt updated successfully");
      }
    } catch (e) {
      Get.defaultDialog(
          title: "Error",
          content: Text(
              "Failed to update prompt, Please refresh the page and try again"));
    }
    isPromptUpdating.value = false;
    isPromptUpdating.refresh();
  }

  void startCallResultsMonitor(String current_token) {
    bool isInLoop = false;
    int loopCount = 0;
    timer = Timer.periodic(const Duration(seconds: 5), (_) async {
      if (!isInLoop) {
        isInLoop = true;
        loopCount++;
        if (loopCount > 50) {
          timer?.cancel();
          return;
        }
        try {
          if (token != current_token) {
            timer?.cancel();
          }
          checkUpdateCallRecordingStatus();
          checkUpdateVerdictStatus();
          checkUpdateCallTranscript();
          if (isCallRecordingAvailable.value &&
              isCallTranscriptAvailable.value &&
              isVerdictAvailable.value) {
            timer?.cancel();
          }
        } catch (e) {
          print(e);
        }
        isInLoop = false;
      }
    });
  }

  void checkUpdateWebRtcStatus() {
    if (webRtcClient == null) {
      isWebRtcClientDisconnected = true;
      return;
    }

    if (webRtcClient!.isDisconnected) {
      isWebRtcClientDisconnected = true;
    }
  }

  Future<void> checkUpdateCallRecordingStatus() async {
    try {
      if (isCallRecordingAvailable.value) return;
      final res = await dio.post(getCallRecordingUrl, data: {"token": token});

      if (res.data["success"]) {
        print(res.data);
        isCallRecordingAvailable.value = true;
        callRecordingFileUrl.value =
            "$serverUrl${res.data["message"]["recording_file_url"]}"; //message.recording_file_url;
        print(callRecordingFileUrl.value);
        callRecordingFileUrl.refresh();
        // ["message"]["recording_file_url"];
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> checkUpdateVerdictStatus() async {
    try {
      if (isVerdictAvailable.value) return;
      final res = await dio.post(getVerdictUrl, data: {"token": token});
      print("call verdict request response: ${res}");
      if (res.data["success"]) {
        isVerdictAvailable.value = true;
        isVerdictAvailable.refresh();
        callVerdict.value = res.data["message"]["verdict"];
        callVerdict.refresh();
        isWebRtcSession.value = false;

        print("call verdict received: ${callVerdict.value}");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> checkUpdateCallTranscript() async {
    try {
      if (isCallTranscriptAvailable.value) return;
      final res = await dio.post(getCallTranscriptUrl, data: {"token": token});

      if (res.data["success"]) {
        final jsonString = jsonEncode(res.data["message"]["transcript"]);
        final raw = jsonDecode(jsonString);
        final parsed = raw
            .map((key, value) => MapEntry(key, value as Map<String, dynamic>));

        final reversedEntries = parsed.entries.toList().reversed;
        final timestampMap = Map<dynamic, dynamic>.fromEntries(reversedEntries);
        Map<String, Map<String, dynamic>> callTranscriptParsed = {};
        for (var entry in timestampMap.entries) {
          callTranscriptParsed.addAll(
              {entry.key.toString(): Map<String, dynamic>.from(entry.value)});
          print(
              "${entry.key.toString()} ${Map<String, dynamic>.from(entry.value)}}");
        }

        callTranscript.value = callTranscriptParsed;
        callTranscript.refresh();
        isCallTranscriptAvailable.value = true;
      }
    } catch (e) {
      print('error in checkUpdateCallTranscript: $e');
    }
  }

  Future<void> playCallRecording() async {
    try {
      // ignore: unused_local_variable
      final duration = await audioPlayer.setUrl(callRecordingFileUrl.value);
      await audioPlayer.play();
    } catch (e) {
      print(e);
    }
  }

  Future<void> stopPlayingCallRecording() async {
    try {
      await audioPlayer.stop();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}

const agentiqPrompt = """Edit this text to match your business process 
- Dont translate technical words, example, "AI", "automate", "software", "process", "email", etc
- You have cold called the customer. The customer can be either a business or a professional.
- You will generate a sales lead for the AI driven Software.
- You will learn customer's business requirements with relevant questions, 
  example:"can i work for you as telecaller, recruiter in multiple languages", 
  "can i generate leads from your linkedin account, emails or databases?",
  and explain how Botify can help.
- Company Name: Agentiq-Things LLP
- Product Name: Botify
- Description: Botify automates end-to-end business process using AI
- What is & How does:
    - Botify can use Android Phones, VoIP/SIP accounts, whatsapp, email accounts, social media accounts, databases, spreadsheets, documents, 3rd party APIs, etc
    - By using RAG, Fine Tuning and vector embeddings, semantic search, browser automation
If you are not able to generate relevant answer, inform that support team will connect
""";

/*
  - What Botify Can do?
    - Access email accounts,  whatsapp accounts, social media accounts, 3rd Party APIs and communicate thru them, analyze them and generate leads
    - Scrape any website, automate any web based workflows
    - Access and analyze databases, excel spreadsheets, perform database operations
    - Communicate thru Android Mobiles via PSTN Calls, SIP/VoIP, SMS, Whatsapp, etc, Bridge them among Business users both outbound and inbound
    - Access and manage documents like PDF, Word, Excel, etc for documents like reports, contracts, invoices, resumes etc
*/

const agentiqPromptOld = """Edit this text to match your business process 
You will explain the below company profile and product information based on conversation with customer, 
If you need example use cases of this product, you can call the tool "get_agentiq_example_use_cases"
If you are not able to generate relevant answer to a customer query, inform the customer that you are communicating the support team and they will connect soon
Company: AgentIQ Things LLP
Product: Botify – Personalized AI Assistants for End-to-End Business Automation
Core Capabilities:
    Lead generation from emails, LinkedIn, and web.
    Automated creation of blogs, infographics, presentations, and docs.
    AI voice agents for outbound calls via SIM (PSTN), SIP/VoIP, Accounting
    Ad performance monitoring + strategy suggestions.
    Browser automation: social media engagement, blog writing, group joining, content scraping with
     captcha bypassing.
    AI voice agents for inbound/outbound calls via SIM (PSTN), SIP/VoIP.
    WhatsApp: bulk messaging + interactive chat for product education.
    AI-powered customer support assistant (FAQs, onboarding, retention).
    Document/image/contract analysis (legitimacy, clauses, compliance).
    Compliance watchdog: monitor regulatory changes, suggest low-cost adherence.
    Server/software ops: read logs, optimize cloud costs (e.g., suggest preemptible VMs & auto-restart them).
    CRM integration or AI-as-CRM.
Tech Stack:
    RAG, fine-tuning, vector embeddings, semantic search.
    API, SDK, cloud system integrations.
    Cloud/on-prem AI deployment.
    Communication via email, SMS, WhatsApp, voice in 200+ languages.
    Full browser + UI automation.
Any Specific Requirements:
    Based on requirements, a simple 4 GB RAM PC or a Pi-Zero may be required
Extensions:
    Based on the requirements, the features can be extended
""";
