import 'package:get/get.dart';
import 'package:relaks_media/Repo/chat_repository.dart';

class ChatController extends GetxController{
  var chatList=[].obs;

Future<void> getChats() async{
  chatList.add(await ChatRepository().fetchChatData(2));
  print("chatdata:"+ chatList.length.toString());
}
}