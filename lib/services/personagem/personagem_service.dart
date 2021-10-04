import 'dart:developer';

import 'package:app_desafio/utils/utils.dart';
import 'package:dio/dio.dart';

class PersonagemService {
  final itemsPerPage = 6;
  var lastTotalReturnedItems = 0;
  var firstCall = true;

  Future<dynamic> getPersonagens({int offset = 0, int page = 0}) async {
    offset = (page * itemsPerPage);
    String url = Utils.generateUrl("characters");
    Map<String, dynamic> queryParameters = {
      "limit": itemsPerPage.toString(),
      "offset": offset.toString()
    };

    return await Dio()
        .get(url, queryParameters: queryParameters)
        .then((response) {
      return response;
    }).catchError((onError) {
      log("Erro ao buscar os dados");
    });
  }
}
