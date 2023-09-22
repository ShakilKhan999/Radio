import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relaks_media/screens/Chat/chat_controller.dart';
import 'conversation_screen.dart';
import '../../message_request_screen.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = '/chat';
  final List<ChatAccount> chatAccounts = [
    ChatAccount(
      imageUrl: 'images/chat1.png',
      name: 'Sebastain Rude',
      lastMessage: 'Perfect will check it, please check',
      time: '9:34 AM',
    ),
    ChatAccount(
      imageUrl: 'images/chat2.png',
      name: 'Caroline Varsaha',
      lastMessage: 'Perfect will check it, please check',
      time: '8:12 AM',
    ),
    // Add more chat accounts here
  ];

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    chatController.getuserList();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Active',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 18.0.sp,
                      ),
                    ),
                    SizedBox(width: 5.0.w),
                    Container(
                      height: 25.sp,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Colors.grey, Colors.black],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Text(
                          '${chatAccounts.length}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            fontSize: 18.0.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MessageRequestScreen.routeName,
                      arguments: chatAccounts,
                    );
                  },
                 child: Row(
                    children: [
                      Text(
                        'Message Request',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 18.0.sp,
                        ),
                      ),
                      SizedBox(width: 5.0.w),
                      Container(
                        height: 25.sp,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Colors.grey, Colors.black],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Text(
                            '2',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 18.0.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Obx(()=>Expanded(
            child: ListView.builder(
              itemCount: chatController.chatuserlist.length,
              itemBuilder: (context, index) {
                final chatAccount = chatController.chatuserlist[index];
                return GestureDetector(
                  onTap: () {
                    chatController.getChats(chatAccount.id);
                    // Navigate to the conversation screen
                    Navigator.pushNamed(
                      context,
                      ConversationScreen.routeName,
                      arguments: chatAccount,
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(chatAccount.avatar==null?chatAccounts[0].imageUrl:chatAccount.avatar),
                    ),
                    title: Text(
                      chatAccount.name==null?'':chatAccount.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    trailing: Text(
                      '',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}

class ChatAccount {
  final String imageUrl;
  final String name;
  final String lastMessage;
  final String time;

  ChatAccount({
    required this.imageUrl,
    required this.name,
    required this.lastMessage,
    required this.time,
  });
}
