import 'data_model.dart';

class ResponseModel {
  DataModel? data;

  ResponseModel(this.data);

  ResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? DataModel.fromJson(json['data']) : null;
  }
}
