import 'package:get/get.dart';
import 'package:work/model/message.dart';

class ChatController extends GetxController {
  var chatMessages = <Message>[].obs;
  var connectedUser = 0.obs;
}
