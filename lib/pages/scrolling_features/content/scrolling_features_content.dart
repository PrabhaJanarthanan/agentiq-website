import '../../../utils/constants/image_strings.dart';

class ScrollingFeaturesContent {
  final String icon;
  final String title;
  final String subtitle;

  ScrollingFeaturesContent({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

List<ScrollingFeaturesContent> scrollingFeaturesUtils = [
  ScrollingFeaturesContent(
    icon: ATImages.aiBot,
    title: 'Voice Agent Automation',
    subtitle:
        'Automate outbound calls for sales, customer support, and more—your AI-powered voice agent works 24/7 to engage customers efficiently.',
  ),
  ScrollingFeaturesContent(
    icon: ATImages.multiLanguage,
    title: 'Supports Indian Languages',
    subtitle:
        'Connect with customers in their preferred language—Hindi, Marathi, Tamil, Telugu, Kannada, Malayalam, and more.',
  ),
  ScrollingFeaturesContent(
    icon: ATImages.multiChannel,
    title: 'Multi-Channel Communication',
    subtitle:
        'Seamlessly integrate PSTN (SIM-based), VoIP-PSTN Bridge, WhatsApp, SMS, and Email to reach your audience wherever they are.',
  ),
  ScrollingFeaturesContent(
    icon: ATImages.simpleHardware,
    title: 'Runs on Simple Hardware',
    subtitle:
        'No fancy setup needed—our AI call bot runs smoothly on an old PC and a basic Android phone, saving infrastructure costs.',
  ),
  ScrollingFeaturesContent(
    icon: ATImages.ownCallcentre,
    title: 'Own Your Call Centre for Life',
    subtitle:
        'One-time purchase, lifetime ownership—say goodbye to monthly subscriptions and take full control of your call centre.',
  ),
  ScrollingFeaturesContent(
    icon: ATImages.customize,
    title: 'Fully Customizable & Scalable',
    subtitle:
        '100% customizable for any business process; scale effortlessly as your operations grow without technical bottlenecks.',
  ),
  ScrollingFeaturesContent(
    icon: ATImages.voiceAutomation,
    title: 'AI Fine-Tuning & Prompt Engineering',
    subtitle:
        'Integrate advanced AI techniques like RAG, fine-tuning, and prompt engineering to build smarter, adaptive voice solutions.',
  ),
];
