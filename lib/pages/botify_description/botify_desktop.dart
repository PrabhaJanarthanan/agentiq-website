import 'package:agentiqthingswebsite/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../common/botify_content/botify_content_desktop.dart';


class BotifyDesktop extends StatefulWidget {
  const BotifyDesktop({Key? key}) : super(key: key);

  @override
  _BotifyDesktopState createState() => _BotifyDesktopState();
}

class _BotifyDesktopState extends State<BotifyDesktop> {
  @override
  Widget build(BuildContext context) {
    return const BotifyContentDesktop(
      s1: 'Powered by RAG Intelligence',
      s2: 'Botify uses Retrieval-Augmented Generation (RAG) to:',
      s3: 'Human-like AI Voice Agent',
      s4: 'TALK ANYWHERE',
      s5: 'LinkedIn Lead Generation',
      s6: 'Web Scraping + UI Automation',
      s7: 'EMAIL THATS WORKS FOR YOU',
      image: ATImages.botifyFront,
      imageLeft: false, 
      addData: true, 
      addText: true,
      addTalkAnywhere: true,
      addLinkedIn: true,
      addWebAuto: true,
      addRag: true,
    );
  }
}
