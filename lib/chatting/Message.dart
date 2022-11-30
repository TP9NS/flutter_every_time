class Message {
  String message;
  String sentByMe;

  Message({required this.message, required this.sentByMe});
  factory Message.fromjson(Map<String, dynamic> json) {
    return Message(message: json["message"], sentByMe: json["sentByme"]);
  }
}
