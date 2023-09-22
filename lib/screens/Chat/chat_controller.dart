import 'package:get/get.dart';

import 'chat_repository.dart';


class ChatController extends GetxController{
var userlistmodel=[].obs;
var chatuserlist=[].obs;
var chatList=[].obs;

Future<void> getuserList() async{
  userlistmodel.clear();
  chatuserlist.clear();
  userlistmodel.add(await ChatRepo().fetchUsers());
  for(int i=0;i<userlistmodel[0].results.users.length;i++){
    chatuserlist.add(userlistmodel[0].results.users[i]);
  }
  print("users: "+chatuserlist.length.toString());
}

Future<void> getChats(int userId) async{
  chatList.add(await ChatRepo().fetchChatData(userId));
  print("chatdata:"+ chatList.length.toString());
}
}