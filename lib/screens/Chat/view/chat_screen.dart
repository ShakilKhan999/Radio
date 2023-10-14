import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relaks_media/screens/Chat/chat_controller.dart';
import 'conversation_screen.dart';
import '../../message_request_screen.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = '/chat';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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

  ChatController chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    chatController.getuserList();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Column(
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
                          child:Obx(()=> Text(
                            '${chatController.chatuserlist.length}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 18.0.sp,
                              color: Colors.white,
                            ),
                          )),
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
                              '0',
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
            Obx(()=>SizedBox(
              height: MediaQuery.of(context).size.height-250.w,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: chatController.chatuserlist.length,
                itemBuilder: (context, index) {
                  final chatAccount = chatController.chatuserlist[index];
                  return GestureDetector(
                    onTap: () {
                      chatController.selecteduserIndex.value=index;
                      chatController.getChats(chatAccount.id).then((value) =>
                          Navigator.pushNamed(
                            context,
                            ConversationScreen.routeName,
                            arguments: chatAccount,
                          )
                      );
                      // Navigate to the conversation screen
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            chatAccount.avatar==null?"https://cdn-icons-png.flaticon.com/512/3135/3135715.png":
                        chatAccount.avatar),
                      ),
                      title: Text(
                        chatAccount.name==null?'':chatAccount.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Tap to start conversation',
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
