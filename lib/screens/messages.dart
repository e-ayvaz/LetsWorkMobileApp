import 'package:work/controller/chat_controller.dart';
import 'package:work/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:intl/intl.dart';



class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Color purple = Colors.purple;
  

  TextEditingController msgInputController = TextEditingController();
  late IO.Socket socket;
  ChatController chatController = ChatController();
  @override
  void initState() {
    socket = IO.io(
        'http://localhost:3000',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .build());
    socket.connect();
    setUpSocketListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color bg = Colors.white;
    return Scaffold(
     
      backgroundColor: bg,
      body: Column(
        children: [
          Expanded(
            child: Container(
              // child: Obx(
              //   ()=> Text(
              //     'Connected User ${chatController.connectedUser}',
              //     style: const TextStyle(color: Colors.black,fontSize: 15),
                  
              //   ),
              // ),
            ),
          ),
          Expanded(
              flex: 9,
              child: Obx(() => ListView.builder(
                  itemCount: chatController.chatMessages.length,
                  itemBuilder: (context, index) {
                    var currentItem = chatController.chatMessages[index];
                    return MessageItem(
                      sendByMe: currentItem.sendByMe == socket.id,
                      message: currentItem.message,
                    );
                  }))),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              style: const TextStyle(
                color: Colors.black,
              ),
              cursorColor: purple,
              controller: msgInputController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.blue)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.blue)),
                  suffixIcon: Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: purple),
                    child: IconButton(
                        onPressed: () {
                          sendMessage(msgInputController.text);
                          msgInputController.text = "";
                        },
                        icon: const Icon(Icons.send, color: Colors.white)),
                  )),
            ),
          ))
        ],
      ),
      
    );
  }

  void sendMessage(String text) {
    var messageJson = {"message": text, "sendByMe": socket.id};
    socket.emit('message', messageJson);
    chatController.chatMessages.add(Message.fromJson(messageJson));
  }

  void setUpSocketListener() {
    socket.on('message-receive', (data) {
      print(data);
      chatController.chatMessages.add(Message.fromJson(data));
    });
     socket.on('connected-user', (data) {
      print(data);
      chatController.connectedUser.value = data;
    });
  }
  
}

class MessageItem extends StatelessWidget {
  const MessageItem({Key? key, required this.sendByMe, required this.message})
      : super(key: key);
  final bool sendByMe;
  final String message;
  @override
  Widget build(BuildContext context) {
    dynamic currentTime = DateFormat.jm().format(DateTime.now());
    Color black = const Color.fromARGB(255, 90, 155, 229);
    Color purple = const Color.fromARGB(255, 138, 124, 226);
    return Align(
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: sendByMe ? purple : black,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              message,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              currentTime,
              style:
                  TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
