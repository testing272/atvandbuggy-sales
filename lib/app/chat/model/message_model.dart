class MessageModel {
  final String message;
  final String messageId;
  final bool deleteForEveryOne;
  final bool deleteForUser;
  final bool isReceived;

  MessageModel({
    required this.message,
    required this.messageId,
    required this.deleteForEveryOne,
    required this.deleteForUser,
    this.isReceived = false,
  });

  factory MessageModel.fromMap({required Map data, required String id}) {
    return MessageModel(
      message: data['message'],
      messageId: id,
      deleteForEveryOne: data['deletedForEveryOne'],
      deleteForUser: data['deletedForUser'],
    );
  }
}
