import 'package:flutter/material.dart';
import 'package:si_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messagesList = [
      Message(text: 'Que oondas',fromWho: FromWho.mine),
      Message(text: 'Buneas', fromWho: FromWho.mine)
  ];

  Future<void> sendMessage (String text) async{
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messagesList.add(newMessage);

    notifyListeners();   //estudiar este metodo
  }
}