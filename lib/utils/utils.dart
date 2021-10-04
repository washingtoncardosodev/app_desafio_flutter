import 'dart:convert';
import 'package:crypto/crypto.dart';

class Utils {
  static String baseUrl = "http://gateway.marvel.com/v1/public/";
  static String publicApiKey = "53ec6adbe803cfd2e1fe0a08bcdf0905";
  static String privateApiKey = "a9827bfc3b01de4f92b4d161ca43dd774262a409";

  static String generateUrl(String endpoint, {String adicional = ""}) {
    var hash = generateHash();
    String url =
        "${Utils.baseUrl}$endpoint?apikey=${Utils.publicApiKey}&hash=$hash&ts=${timeStamp.toIso8601String()}$adicional";

    return url;
  }
}

var timeStamp = DateTime.now();

String generateHash() {
  return generateMd5(
      timeStamp.toIso8601String() + Utils.privateApiKey + Utils.publicApiKey);
}

String generateMd5(String value) {
  return md5.convert(utf8.encode(value)).toString();
}
