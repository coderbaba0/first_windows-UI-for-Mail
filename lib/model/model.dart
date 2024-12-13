class Email {
  final String id;
  final String sender;
  final String subject;
  final String snippet;

  Email({
    required this.id,
    required this.sender,
    required this.subject,
    required this.snippet,
  });

  factory Email.fromJson(Map<String, dynamic> json) {
    return Email(
      id: json['id'],
      sender: json['sender'],
      subject: json['subject'],
      snippet: json['snippet'],
    );
  }
}
