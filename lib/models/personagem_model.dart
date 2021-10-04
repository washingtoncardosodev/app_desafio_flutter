import 'comics_model.dart';
import 'thumbnail_model.dart';

class PersonagemModel {
  int? id;
  String? name;
  String? description;
  String? modified;
  ThumbnailModel? thumbnail;
  String? resourceURI;
  ComicsModel? comics;
  bool? clicked = false;

  PersonagemModel({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceURI,
    this.comics,
  });

  PersonagemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? ThumbnailModel.fromJson(json['thumbnail'])
        : null;
    resourceURI = json['resourceURI'];
    comics =
        json['comics'] != null ? ComicsModel.fromJson(json['comics']) : null;
  }
}
