class ItemsModel {
  String? resourceURI;
  String? name;

  ItemsModel({this.resourceURI, this.name});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
  }
}
