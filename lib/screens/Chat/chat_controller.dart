import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:web_socket_channel/io.dart';
import 'chat_repository.dart';


class ChatController extends GetxController{
var userlistmodel=[].obs;
var chatuserlist=[].obs;
var chatList=[].obs;
var selecteduserIndex=0.obs;

final messageController = TextEditingController();
late IO.Socket socket;

void connectToServer() {

try{
  socket = IO.io('ws://16.171.2.83/ws/chat/2/?token=e0e6b09f5a9b9734c44d039ea02d7630adee76d9', <String, dynamic>{
    'transports': ['websocket'], // Use the appropriate transport method
  });
}
catch(e){
  print('Socket error: $e');
}

  socket.on('connect', (_) {
    print('Connected to server');
  });

  socket.on('disconnect', (_) {
    print('Disconnected from server');
  });

  // You can also listen for custom events from the server
  socket.on('customEvent', (data) {
    print('Received data from server: $data');
  });
}

@override
  void onInit() {
    //connectToServer();
    super.onInit();
  }
//final channel = IOWebSocketChannel.connect('http://16.171.2.83');

  Future<void> sendmessagetoAPI(String senderId, String receiverId, String mssg)async{
 await ChatRepo().sendMessagetoApi(senderId, receiverId, mssg);
getChats(int.parse(receiverId));
  }

void sendMessage2(int id) async {
  print("userId: "+id.toString());
  final channel = await IOWebSocketChannel.connect('ws://16.171.2.83/ws/chat/${id}/?token=0b104116364581cc372075ca1ed028f6903c0036');
  if (channel != null && channel.sink != null) {
    channel.sink.add('Hello dev');
  } else {
    print('WebSocket channel is not available.');
  }
  getChats(id);
}

void sendMessage(int userId) {
  socket.emit('sendMessage', messageController.text);
  getChats(userId);// Replace 'sendMessage' with the event name used by your server
}

Future<void> getuserList() async{
  userlistmodel.clear();
  chatuserlist.clear();
  userlistmodel.add(await ChatRepo().fetchUsers());
  for(int i=0;i<userlistmodel[0].results.users.length;i++){
    chatuserlist.add(userlistmodel[0].results.users[i]);
  }
  print("users: "+chatuserlist.length.toString());
}

Future<void> getChats(int id) async{
  chatList.clear();
  chatList.add(await ChatRepo().fetchChatData(id));
  print("chatdata:"+ chatList.length.toString());
}
}