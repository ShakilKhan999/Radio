import 'package:get/get.dart';

import 'chat_repository.dart';


class ChatController extends GetxController{
var userlist=[].obs;

Future<void> getuserList() async{
  userlist.clear();
  userlist.add(await ChatRepo().fetchUsers());
  print("users: "+userlist.length.toString());
}
}