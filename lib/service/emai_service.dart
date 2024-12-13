import 'dart:async';

import 'package:first_windows/model/model.dart';

class EmailService {
  static Future<List<Email>> fetchEmails() async {
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(
      20,
      (index) => Email(
        id: '$index',
        sender: 'Sender $index',
        subject: 'Mail From Flutter Fever $index',
        snippet: 'Hey Guys, what are u doing.. $index.',
      ),
    );
  }

  static Future<Email> fetchEmailDetail(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return Email(
      id: id,
      sender: 'Sender $id',
      subject: 'Detailed Subject $id',
      snippet: 'This is the detailed email content for email $id.',
    );
  }
}
