
import 'package:dio/dio.dart';
import 'package:si_no_app/config/infrastructure/models/yes_no_models.dart';
import 'package:si_no_app/domain/entities/message.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer () async{
    final response = await _dio.get('https://yesno.wtf/api');

    final yesnoModel = YesNoModel.fromJsonMap(response.data);

    return Message(
      text: yesnoModel.answer,
    fromWho: FromWho.other,
    imageUrl: yesnoModel.image
    );
    
  }
}


//https://pub.dev/packages/http