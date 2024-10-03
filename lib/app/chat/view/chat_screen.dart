import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../theme/app_theme.dart';
import '../model/message_model.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String profileUrl;
  const ChatScreen({super.key, required this.name, required this.profileUrl});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController sendMessageController = TextEditingController();
  List<MessageModel> reveredMessages = [
    MessageModel(
        message: 'I am fine.',
        messageId: '123436',
        isReceived: true,
        deleteForEveryOne: false,
        deleteForUser: false),
    MessageModel(
        message: 'Hi how are you?',
        messageId: '12343',
        deleteForEveryOne: false,
        deleteForUser: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, theme, child) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: CachedNetworkImageProvider(widget.profileUrl),
              ),
              10.horizontalSpace,
              Text(
                widget.name,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    reverse: true,
                    itemCount: reveredMessages.length,
                    itemBuilder: (context, index) {
                      return reveredMessages[index].deleteForEveryOne
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                margin: const EdgeInsets.only(
                                    bottom: 10, left: 10, right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Text(
                                  'Deleted for everyone',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.withOpacity(0.7)),
                                ),
                              ),
                            )
                          : reveredMessages[index].deleteForUser
                              ? Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    margin: const EdgeInsets.only(
                                        bottom: 10, left: 10, right: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    child: Text(
                                      'Deleted for me',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey.withOpacity(0.7)),
                                    ),
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment:
                                      reveredMessages[index].isReceived
                                          ? MainAxisAlignment.start
                                          : MainAxisAlignment.end,
                                  children: [
                                    if (reveredMessages[index].isReceived)
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: CircleAvatar(
                                          backgroundImage:
                                              CachedNetworkImageProvider(
                                                  widget.profileUrl),
                                        ),
                                      ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: reveredMessages[index].isReceived
                                            ? const Color(0xffF2F4F5)
                                            : const Color(0xff6B4EFF),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        reveredMessages[index].message,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: reveredMessages[index]
                                                    .isReceived
                                                ? Colors.black
                                                : Colors.white),
                                      ),
                                    ),
                                  ],
                                );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: sendMessageController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          hintText: "Type your message",
                          hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff72777A)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(color: Colors.grey.withOpacity(0.5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: theme.primaryColor),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    IconButton(
                      icon: Icon(Icons.send, color: theme.primaryColor),
                      onPressed: () {
                        if (sendMessageController.text.trim() != '') {
                          reveredMessages.insert(
                              0,
                              MessageModel(
                                  message: sendMessageController.text.trim(),
                                  messageId: '12343',
                                  deleteForEveryOne: false,
                                  deleteForUser: false));
                          reveredMessages.insert(
                              0,
                              MessageModel(
                                  isReceived: true,
                                  message: 'Hi, i am busy right now.',
                                  messageId: '123',
                                  deleteForEveryOne: false,
                                  deleteForUser: false));
                          sendMessageController.clear();
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
