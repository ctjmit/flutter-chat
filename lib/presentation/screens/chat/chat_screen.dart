import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_no_app/domain/entities/message.dart';
import 'package:si_no_app/presentation/Widgets/chat/message_burbuja.dart';
import 'package:si_no_app/presentation/Widgets/otro_message_burbuja.dart';
import 'package:si_no_app/presentation/Widgets/shared/message_field_box.dart';
import 'package:si_no_app/presentation/providers/chat_providers.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(   //contenedor principal 
      appBar: AppBar(   //barra de arriba
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/147/147142.png'),
          ),
          ),
          title: const Text('Cristian Marquez 👽'),
          centerTitle: false,
          backgroundColor: Color.fromARGB(255, 5, 196, 186),
      ),
      body: _ChatView(),           // es el cuerpo del scaffold
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    final chatprovider = context.watch<ChatProvider>();
    return SafeArea(
      child:  Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10
        ), 
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              controller: chatprovider.chatScrollControler,
              itemCount: chatprovider.messagesList.length,   //se utitliza un constructor vacio
              itemBuilder: (context, index){
                final message = chatprovider.messagesList[index];
                return (message.fromWho == FromWho.other)
                ? const OtroMyMessage() 
                : MyMessage(message: message);
              },
            ),
          ),
          //Caja de texto de mensaje
         MessageFieldBox(
            //onValue: (value) => chatprovider.sendMessage(value),
            onValue: chatprovider.sendMessage,
        )
        ],
        ) 
      ,)
    );
  }
}