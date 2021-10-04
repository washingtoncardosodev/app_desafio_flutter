import 'items_model.dart';

class ComicsModel {
  int? available;
  String? collectionURI;
  List<ItemsModel?>? items;
  int? returned;

  ComicsModel({this.available, this.collectionURI, this.items, this.returned});

  ComicsModel.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(ItemsModel.fromJson(v));
      });
    } else {
      items = null;
    }
    returned = json['returned'];
  }
}
