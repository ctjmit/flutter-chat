import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:si_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> message = [
      Message(text: 'Que oondas',fromWho: FromWho.mine),
      Message(text: 'Buneas', fromWho: FromWho.other)
  ];

  Future<void> sendMessage (String text) async{
    
  }
}