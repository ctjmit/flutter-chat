import 'package:flutter/material.dart';
import 'package:si_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:si_no_app/domain/entities/message.dart';
//import 'package:si_no_app/presentation/Widgets/otro_message_burbuja.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollControler = ScrollController();
  final getyesnoanswer = GetYesNoAnswer();

  List<Message> messagesList = [
      Message(text: 'Que oondas',fromWho: FromWho.mine),
      Message(text: 'Buneas', fromWho: FromWho.mine)
  ];

  Future<void> sendMessage (String text) async{
    if(text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messagesList.add(newMessage);
    if(text.endsWith('?')){
      await otherReply();
    }

    notifyListeners();   //estudiar este metodo

    moveScrolltoBottom();
  }

  Future<void> moveScrolltoBottom() async{
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollControler.animateTo(
      chatScrollControler.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
      );
  }
  Future<void> otherReply() async{
    final otroMyMessage = await getyesnoanswer.getAnswer();
    messagesList.add(otroMyMessage);
    notifyListeners();
    moveScrolltoBottom();

  }

}