// import 'package:agentiqthingswebsite/utils/constants/colors.dart';
// import 'package:agentiqthingswebsite/utils/constants/sizes.dart';
// import 'package:flutter/material.dart';

// void showRequestDemoForm(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     builder: (BuildContext context) {
//       return RequestDemoForm();
//     },
//   );
// }

// class RequestDemoForm extends StatefulWidget {
//   @override
//   _RequestDemoFormState createState() => _RequestDemoFormState();
// }

// class _RequestDemoFormState extends State<RequestDemoForm> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _phoneController = TextEditingController();
//   bool _isLoading = false;
//   bool _isSubmitted = false; 

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 800),
//       curve: Curves.easeInOut,
//       padding: const EdgeInsets.all(20),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
//       ),
//       child: Padding(
//         padding: EdgeInsets.only(
//           bottom: MediaQuery.of(context).viewInsets.bottom,
//         ),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Semantics(
//                   child:  Text(
//                     '"Request a personalized demo today and discover how Agentiq - Things can streamline your customer engagement and drive results."',
//                     style: Theme.of(context).textTheme.headlineSmall
//                   ),
//                 ),
//                  SizedBox(height: ATSizes.spaceBtwInputFields),
//                 // TextFormField(
//                 //   decoration: const InputDecoration(
//                 //     labelText: 'Full Name *',
//                 //     hintText: 'Enter your full name',
//                 //     hintStyle: TextStyle(
//                 //       color: Colors.grey,
//                 //       fontSize: 12,
//                 //     ),
//                 //     border: OutlineInputBorder(
//                 //       borderRadius: BorderRadius.all(Radius.circular(20)),
//                 //     ),
//                 //   ),
//                 //   validator: (value) {
//                 //     if (value == null || value.isEmpty) {
//                 //       return 'Please enter your name';
//                 //     }
//                 //     return null;
//                 //   },
//                 // ),
//                 SizedBox(height: ATSizes.spaceBtwInputFields),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     labelText: 'Company Name (Optional)',
//                     hintText: 'Enter your company name',
//                     hintStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 12,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: ATSizes.spaceBtwInputFields),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     labelText: 'Email Address *',
//                     hintText: 'Enter your email address',
//                     hintStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 12,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                     ),
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value == null ||
//                         value.isEmpty ||
//                         !value.contains('@')) {
//                       return 'Please enter a valid email';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: ATSizes.spaceBtwInputFields),
//                 // Regular Phone Number Input Field
//                 TextFormField(
//                   controller: _phoneController,
//                   decoration: const InputDecoration(
//                     labelText: 'Phone Number *',
//                     hintText: 'Enter your phone number with Country code',
//                     hintStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 12,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                     ),
//                   ),
//                   keyboardType: TextInputType.phone,
//                   validator: (value) {
//                     // Validate phone number
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your phone number';
//                     }
//                     final phoneRegex =
//                         RegExp(r'^\+\d{1,3}[-\s]?\d{1,3}[-\s]?\d{7,14}$');
//                     if (!phoneRegex.hasMatch(value)) {
//                       return 'Please enter a valid phone number with country code';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: ATSizes.spaceBtwInputFields),
//                 DropdownButtonFormField<String>(
//                   decoration: const InputDecoration(
//                     labelText: 'How We Can Assist You? *',
//                     hintStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 12,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                     ),
//                   ),
//                   items: [
//                     'Whatsapp Bulk Messages',
//                     'CRM',
//                     'Unlimited Chatbot',
//                     'AI Content Generation',
//                     'Other'
//                   ].map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   onChanged: (String? value) {},
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please select how we can assist you';
//                     }
//                     return null;
//                   },
//                 ),
//                  SizedBox(height: ATSizes.spaceBtwInputFields),
//                 TextFormField(
//                   maxLines: 4,
//                   decoration: const InputDecoration(
//                     labelText: 'Message',
//                     hintText: 'Tell us about your requirements',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                     ),
//                   ),
//                 ),
//                  SizedBox(height: ATSizes.spaceBtwInputFields),
//                 if (_isLoading)
//                    CircularProgressIndicator(
//                     color: ATColors.primaryColor,
//                   )
//                 else if (_isSubmitted) 
//                    Text(
//                     'Request Received 😊. We will reach you soon 👍...',
//                     style: TextStyle(fontSize: 20, color: Colors.blueGrey),
//                   )
//                 else
//                   Container(
//                     decoration: BoxDecoration(
//                       gradient: const LinearGradient(
//                         colors: [Colors.pinkAccent, Colors.blueAccent],
//                         begin: Alignment.bottomLeft,
//                         end: Alignment.topRight,
//                       ),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: ElevatedButton(
                      
//                       style: ElevatedButton.styleFrom(
                       
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
                       
//                       ),
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           setState(() {
//                             _isLoading = true;
//                             _isSubmitted = false; 
//                           });

//                           Future.delayed(const Duration(seconds: 3), () {
//                             setState(() {
//                               _isLoading = false;
//                               _isSubmitted = true;
//                             });
//                           });
//                         }
//                       },
//                       child:  Text(
                        
//                         'Submit Request',
//                         style: Theme.of(context).textTheme.bodyMedium,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
