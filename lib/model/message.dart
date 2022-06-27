class Message {
  String message;
  String sendByMe;
  Message({required this.message, required this.sendByMe});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      message: json['message'],
      sendByMe: json['sendByMe'],
    );
  }
}
