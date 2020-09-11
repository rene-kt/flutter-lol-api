import 'package:FlutterGifGallery/service/riot-api.service.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Requisition {
  String baseUrl = RiotApi.base_url;
  String key = RiotApi.key;

  Future<Map> returnSummonerId(String summonerName) async {
    String urlSummoner = baseUrl + RiotApi.summonerIdUrl;

    http.Response response =
        await http.get(urlSummoner + summonerName + "?" + "api_key=" + key);
    print(response.body);
    print(urlSummoner + summonerName + "?" + "api_key=" + key);
    return json.decode(response.body);
  }
}
