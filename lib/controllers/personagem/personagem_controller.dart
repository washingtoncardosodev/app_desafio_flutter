import 'dart:convert';

import 'package:app_desafio/models/personagem_model.dart';
import 'package:app_desafio/models/response_model.dart';
import 'package:app_desafio/services/personagem/personagem_service.dart';
import 'package:mobx/mobx.dart';
part 'personagem_controller.g.dart';

class PersonagemController = _PersonagemControllerBase
    with _$PersonagemController;

abstract class _PersonagemControllerBase with Store {
  final personagemService = PersonagemService();

  ObservableList<PersonagemModel> personagens =
      ObservableList<PersonagemModel>.of([]);

  @observable
  int itemsPerPage = 6;
  @observable
  int page = 0;
  @observable
  int lastTotalReturnedItems = 0;
  @observable
  bool firstCall = true;
  @observable
  bool isLoading = false;
  @observable
  bool isError = false;

  @action
  Future<List<PersonagemModel>>? getPersonagens() {
    isLoading = true;
    if (!firstCall) {
      if (lastTotalReturnedItems < itemsPerPage) {
        personagens.clear();
      }
    }

    firstCall = false;

    personagemService.getPersonagens(page: page).then((response) {
      final jsonValue = jsonDecode(response.toString());
      final object = ResponseModel.fromJson(jsonValue);
      lastTotalReturnedItems = object.data!.count ?? 0;
      page++;
      object.data!.personagens!.forEach((element) {
        personagens.add(element!);
      });
      isLoading = false;
      return personagens;
    }).catchError((onError) {
      isError = true;
    });
  }
}
