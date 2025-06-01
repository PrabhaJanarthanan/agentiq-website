import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class FrontPageMobile extends StatelessWidget {
  final bool bulletText;
  const FrontPageMobile({super.key,  required this.bulletText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ATSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Semantics(
              label: 'Botify AI slogan: Botify - AI That Gets Things Done in 24 Hours',
              header: true,
              child: Text(
                '“Botify - AI That Gets Things Done in 24 Hours”',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: ATSizes.spaceBtwSections),
          Semantics(
            label: "Botify product description",
            child: Text(
              "Botify Anyone Work is your personal AI-powered assistant tailored to automate your communication and outreach needs—calls, emails, messaging, and more—all from a basic PC + Android phone setup.",
              style: Theme.of(context).textTheme.labelMedium?.copyWith(height: 1.5),
              textAlign: TextAlign.start,
              
            ),
            
          ),
          const SizedBox(height: ATSizes.spaceBtwItems),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(onPressed: (){}, 
            child: Padding(
              padding: const EdgeInsets.all(ATSizes.defaultSpace/3),
              child: Text("Book a Demo",
              style: Theme.of(context).textTheme.labelMedium,),
            )),
          ),
            const SizedBox(height: ATSizes.spaceBtwItems),

          if(bulletText) _buildBulletText(context)
        ],
      ),
    );
  }

  Widget _buildBulletText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Powered by RAG Intelligence - connects your data sources to deliver personalized, AI-driven conversations.", {
                      "RAG Intelligence": ATColors.primaryColor,
                }),
                const SizedBox(height: 15),
                _buildBulletPoint(context, "Human-like AI voice Agent-Real PSTN Calls or go with Twilio, Plivo and others", {
                      "PSTN Calls": ATColors.primaryColor,
                      "Twilio, Plivo": ATColors.primaryColor,
                }),
              
                 const SizedBox(height: 15),
                _buildBulletPoint(context, "Web Scraping + AI Automation-Scrape Websites, Automate repetitive workflows like job board submissions",
                {
                      "Scrape Websites": ATColors.primaryColor,
                }
                ),
                   const SizedBox(height: 15),
                _buildBulletPoint(context, "Talk Anywhere - Integrate and converse over WhatsApp, SMS, Telegram",
                {
                      "WhatsApp, SMS, Telegram": ATColors.primaryColor,
                }
                ),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildBulletPoint(BuildContext context, String fullText, Map<String, Color> coloredWords) {
  List<TextSpan> spans = [];

  String remaining = fullText;

  coloredWords.forEach((word, color) {
    int index = remaining.indexOf(word);
    if (index != -1) {
      // Before colored part
      if (index > 0) {
        spans.add(TextSpan(
          text: remaining.substring(0, index),
          style: Theme.of(context).textTheme.labelMedium,
        ));
      }
      // Colored part
      spans.add(TextSpan(
        text: word,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: color),
      ));
      // Update remaining text
      remaining = remaining.substring(index + word.length);
    }
  });

  // Add the remaining text
  if (remaining.isNotEmpty) {
    spans.add(TextSpan(
      text: remaining,
      style: Theme.of(context).textTheme.labelMedium,
    ));
  }

  return Semantics(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Iconsax.tick_circle,
          color: ATColors.primaryColor,
          size: ATSizes.iconSm,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Semantics(
            child: Text.rich(
              TextSpan(children: spans),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    ),
  );
}

}
