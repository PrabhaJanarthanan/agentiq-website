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
//   bool _isLoading = false; // Loading state variable
//   bool _isSubmitted = false; // To track if the request was submitted

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
//                 const Text(
//                   '"Request a personalized demo today and discover how Agentiq - Things can streamline your customer engagement and drive results."',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     labelText: 'Full Name *',
//                     hintText: 'Enter your full name',
//                     hintStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 12,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 10),
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
//                 const SizedBox(height: 10),
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
//                 const SizedBox(height: 10),
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
//                 const SizedBox(height: 10),
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
//                 const SizedBox(height: 10),
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
//                 const SizedBox(height: 20),
//                 // Conditional loading indicator and message
//                 if (_isLoading)
//                   const CircularProgressIndicator(
//                     color: Colors.pinkAccent,
//                   )
//                 else if (_isSubmitted) // Show message only if submitted
//                   const Text(
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
//                         foregroundColor: Colors.white,
//                         backgroundColor: Colors.transparent,
//                         textStyle: const TextStyle(
//                           fontSize: 16,
//                         ),
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           setState(() {
//                             _isLoading = true; // Set loading state
//                             _isSubmitted = false; // Reset submitted state
//                           });

//                           // Simulate a network call (replace this with your actual logic)
//                           Future.delayed(const Duration(seconds: 3), () {
//                             // After the network call, reset loading state
//                             setState(() {
//                               _isLoading = false;
//                               _isSubmitted = true; // Set submitted state
//                             });
//                           });
//                         }
//                       },
//                       child: const Text(
//                         'Submit Request',
//                         style: TextStyle(fontSize: 16, color: Colors.white),
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
