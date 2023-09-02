import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'conversation_screen.dart';
import 'chat_screen.dart';

class MessageRequestScreen extends StatelessWidget {
  static const String routeName = '/message_requests';

  @override
  Widget build(BuildContext context) {
    final List<ChatAccount> messageRequests =
    ModalRoute.of(context)!.settings.arguments as List<ChatAccount>;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back,color: Colors.white,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 50.0.sp),
                  child: Column(
                    children: [
                      Text(
                        'Message Requests',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 18.0.sp,
                        ),
                      ),
                      Text(
                        'Share details about the sender without \nalerting them that their message has been viewed.',
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h,),
            messageRequests.isNotEmpty
                ? Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: messageRequests.length,
                  itemBuilder: (context, index) {
                    final chatAccount = messageRequests[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(chatAccount.imageUrl),
                      ),
                      title: Text(
                        chatAccount.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 18.0.sp,
                        ),
                      ),
                      subtitle: Text(
                        chatAccount.lastMessage,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 35.sp,
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
                              child: IconButton(onPressed: (){},icon: Icon(Icons.done_outlined,color: Colors.white,),)
                            ),
                          ),
                          SizedBox(width: 10.0.w),
                          IconButton(
                            onPressed: () {},
                            icon: ImageIcon(AssetImage('images/close.png'),size: 15.sp,color: Colors.white,),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
                : Center(
              child: Text(
                'No message requests',
                style: TextStyle(
                  fontSize: 18.0.sp,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
