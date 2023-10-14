import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relaks_media/global/shared_preference_helper.dart';
import '../../../global/constants.dart';
import '../chat_controller.dart';
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
    ChatController chatController = Get.put(ChatController());
    //chatController.getChats();
    //final ChatAccount chatAccount = ModalRoute.of(context)!.settings.arguments as ChatAccount;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
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
                          backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/3135/3135715.png"),
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
                         '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0.sp,
                          ),
                        ),
                        Text(
                          'Online',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Obx(()=>SizedBox(
                height: MediaQuery.of(context).size.height-190.h,
                child: chatController.chatList.isEmpty?SizedBox(): ListView.builder(
                  reverse: true,
                  itemCount: chatController.chatList[0].results.length==0?0:
                  chatController.chatList[0].results.length,
                  itemBuilder: (context, index) {
                    final message = chatController.chatList[0].results[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Align(
                        alignment: message.sender.id==1 ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            color: message.sender.id==1 ? Colors.grey.shade900 : Colors.black,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.all(12.0.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.chat,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0.sp,
                                ),
                              ),
                              SizedBox(height: 4.0.h),
                              Text(
                                message.createdAt.toString().substring(0,10),
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
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Expanded(
                      flex:2,
                      child: Container(
                        height: 40.h,
                        width: MediaQuery.of(context).size.width-50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade600),
                          gradient: LinearGradient(
                            colors: [Colors.grey.shade600, Colors.black],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 6.0.w,
                            horizontal: 12.0.h,
                          ),
                          child: TextField(
                            controller: chatController.messageController,
                            decoration: InputDecoration(
                              hintText: 'Type your message here...',
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 45.h,
                        width: 40.w,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: const Icon(Icons.send_outlined),
                            color: Colors.white,
                            onPressed: () async{
                              int? userId = await SharedPreferenceHelper().getInt(key: id);
                              chatController.sendmessagetoAPI(
                                  userId.toString(),
                                  chatController.chatuserlist[chatController.selecteduserIndex.value].id.toString(),
                                  chatController.messageController.text);
                             // chatController.sendMessage2(chatController.chatuserlist[chatController.selecteduserIndex.value].id);
                              chatController.messageController.text='';
                            },
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
