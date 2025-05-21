import 'package:agentiqthingswebsite/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/sizes.dart';


class BotifyContentDesktop extends StatelessWidget {
  final String s1, s2, s3,s4,s5,s6,s7, image;
  final bool imageLeft;
  final bool addData;
  final bool addText;
  final bool addTalkAnywhere;
  final bool addLinkedIn;
  final bool addWebAuto;
  final bool addRag;

  const BotifyContentDesktop({
    Key? key,
    required this.s1,
    required this.s2,
    required this.s3,
    required this.s4,
    required this.s5,
    required this.s6,
    required this.s7,
    required this.image,
    required this.imageLeft,
    this.addData = false,
    this.addText = false,
    this.addTalkAnywhere = false,
    this.addLinkedIn = false,
    this.addWebAuto = false,
    this.addRag = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // final double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (imageLeft) _buildImageSection(context),
          if (imageLeft) const SizedBox(width: 20),
      
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Semantics(
                  header: true,
                  child: Text(
                    s1.toUpperCase(),
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headlineSmall,
                  
                  ),
                ),
                const SizedBox(height: ATSizes.spaceBtwSections/2),
                Text(
                  s2,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineSmall,
                 
                ),
                if (addRag) _buildBulletPointsSectionRAG(context),
                
               const SizedBox(height: ATSizes.spaceBtwSections/2),
                Semantics(
                   header: true,
                  child: Text(
                    s3.toUpperCase(),
                    textAlign: TextAlign.start,
                     style: Theme.of(context).textTheme.headlineSmall,
                                   
                  ),
                ),
                  if (addData) _buildBulletPointsSectionHumanLike(context),
                
                const SizedBox(height: ATSizes.spaceBtwSections/2),
                Semantics(
                   header: true,
                  child: Text(
                    s4.toUpperCase(),
                    textAlign: TextAlign.start,
                     style: Theme.of(context).textTheme.headlineSmall,
                   
                  ),
                ),
                if (addTalkAnywhere) _buildBulletPointsSectionTalkAnywhere(context),
                const SizedBox(height: ATSizes.spaceBtwSections/2),
                Semantics(
                   header: true,
                  child: Text(
                    s5.toUpperCase(),
                    textAlign: TextAlign.start,
                     style: Theme.of(context).textTheme.headlineSmall,
                  
                  ),
                ),
                if (addLinkedIn) _buildBulletPointsSectionLinkedIn(context),
                  const SizedBox(height: ATSizes.spaceBtwSections/2),
                Semantics(
                   header: true,
                  child: Text(
                    s6.toUpperCase(),
                    textAlign: TextAlign.start,
                     style: Theme.of(context).textTheme.headlineSmall,
                    
                  ),
                ),
                if (addWebAuto) _buildBulletPointsSectionWebAutomation(context),
                  const SizedBox(height: ATSizes.spaceBtwSections/2),
                Semantics(
                   header: true,
                  child: Text(
                    s7.toUpperCase(),
                    textAlign: TextAlign.start,
                     style: Theme.of(context).textTheme.headlineSmall,
                  
                  ),
                ),
                if (addText) _buildBulletPointsSectionEmailWorksforYou(context),
              
              ],
            ),
          ),
          if (!imageLeft) const SizedBox(width: 25),
          if (!imageLeft) _buildImageSection(context),
        ],
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [

            //image
            Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: image.isNotEmpty
                    ? DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.contain,
                      )
                    : null,
              ),
              
            ),

            //button
           Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    children: [
      ElevatedButton.icon(
        icon: const Icon(Icons.play_circle_fill),
        label: const Text("Try It Live – Book a Demo"),
        style: ElevatedButton.styleFrom(
          backgroundColor: ATColors.primaryColor,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: Theme.of(context).textTheme.bodySmall,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          
        },
      ),
      const SizedBox(height: 8),
       Text(
        "Only 15 minutes – no pressure, just value.",
        style: Theme.of(context).textTheme.bodySmall,
      ),
    ],
  ),
)

          ],
        ),
        

        
      ),
    );
  }

  Widget _buildBulletPointsSectionHumanLike(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Place or receive real PSTN calls using your PC & Android phone"),
                const SizedBox(height: 10),
                _buildBulletPoint(context, "Or go cloud: integrate with Twilio, Plivo, Vonage, TextNow, and others"),
                const SizedBox(height: 10),
                _buildBulletPoint(context, "AI speaks naturally and acts according to your data and instructions"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPointsSectionEmailWorksforYou(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Automatically send and reply to emails."),
                const SizedBox(height: 10),
                _buildBulletPoint(context, "Read your inbox, understand context, and engage with leads."),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildBulletPointsSectionTalkAnywhere(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Integrate and converse over WhatsApp, SMS, Telegram"),
                const SizedBox(height: 10),
                _buildBulletPoint(context, "Manage multiple conversations effortlessly"),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
    Widget _buildBulletPointsSectionLinkedIn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "AI reads your network’s posts."),
                const SizedBox(height: 10),
                _buildBulletPoint(context, "It generates, qualifies, and contacts leads using your account."),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
    Widget _buildBulletPointsSectionWebAutomation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Scrape websites."),
                const SizedBox(height: 10),
                _buildBulletPoint(context, "Automate repetitive workflows like job board submissions."),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildBulletPointsSectionRAG(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Pull from your own data (Google Drive, Notion, CRM, etc.)"),
                const SizedBox(height: 10),
                _buildBulletPoint(context, "Deliver context-aware conversations and actions."),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildBulletPoint(BuildContext context,  String text) {
    return Semantics(
      child: Row(
        children: [
          const Icon(
            Iconsax.document_text,
            color: ATColors.primaryColor,
            size: ATSizes.iconSm,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelMedium,
             
            ),
          ),
        ],
      ),
    );
  }
}
