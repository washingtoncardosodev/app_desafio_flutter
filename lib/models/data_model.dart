import 'package:app_desafio/models/personagem_model.dart';

class DataModel {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<PersonagemModel?>? personagens;

  DataModel({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.personagens,
  });

  DataModel.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      personagens = [];
      json['results'].forEach((v) {
        personagens?.add(PersonagemModel.fromJson(v));
      });
    }
  }
}
