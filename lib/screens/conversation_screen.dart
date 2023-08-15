import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chat_screen.dart';

class ConversationScreen extends StatefulWidget {
  static const String routeName = '/conversation';

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final List<Message> _messages = [];

  @override
  void initState() {
    super.initState();

    _messages.addAll([
      Message(content: 'Hi', isMe: false, time: '10:00 AM'),
      Message(content: 'Hello', isMe: true, time: '10:01 AM'),
      Message(content: 'How are you?', isMe: false, time: '10:02 AM'),
      Message(content: 'I\'m good. How about you?', isMe: true, time: '10:03 AM'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final ChatAccount chatAccount = ModalRoute.of(context)!.settings.arguments as ChatAccount;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 16.0.w),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(chatAccount.imageUrl),
                        radius: 20.0,
                      ),
                      const CircleAvatar(
                        radius: 6.0,
                        backgroundColor: Colors.green,
                      ),
                    ],
                  ),
                  SizedBox(width: 16.0.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chatAccount.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0.sp,
                        ),
                      ),
                      Text(
                        'Online',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 14.0.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Align(
                      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: message.isMe ? Colors.blue : Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding:  EdgeInsets.all(12.0.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message.content,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0.sp,
                              ),
                            ),
                            SizedBox(height: 4.0.h),
                            Text(
                              message.time,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade900,
                        hintText: 'Type a message...',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:  EdgeInsets.symmetric(
                          vertical: 12.0.w,
                          horizontal: 16.0.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0.w),
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    child: IconButton(
                      icon: const Icon(Icons.send),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final String content;
  final bool isMe;
  final String time;

  Message({
    required this.content,
    required this.isMe,
    required this.time,
  });
}
