import 'package:first_windows/controller/Emailcontroller.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailDetailPage extends StatelessWidget {
  final String emailId;

  EmailDetailPage({required this.emailId});

  @override
  Widget build(BuildContext context) {
    final EmailController emailController = Get.find();

    return ScaffoldPage(
      header: PageHeader(
        leading: BackButton(onPressed: () {
          Navigator.pop(context); // Navigate back to the previous page
        }),
        title: const Text('Email Detail'),
      ),
      content: Obx(() {
        final email = emailController.selectedEmail.value;
        if (emailController.isLoading.value) {
          return const Center(child: ProgressRing());
        }
        if (email == null) {
          return const Center(child: Text('Email not found.'));
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  email.subject,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text('From: ${email.sender}'),
                const SizedBox(height: 8),
                Text('Content: Hi Flutterfever,\n'),
                const SizedBox(height: 8),
                Text(email.snippet),
                const SizedBox(height: 8),
                Image.network(
                  'https://miro.medium.com/v2/resize:fit:1400/0*OckilgOyByn-x242.gif',
                  height: 300,
                  width: 300,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
