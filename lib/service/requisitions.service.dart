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
    return json.decode(response.body);
  }

  Future<List> returnChampions(String id) async {
    String urlChampion = baseUrl + RiotApi.championsUrl;

    http.Response response =
        await http.get(urlChampion + id + "?" + "api_key=" + key);
    return json.decode(response.body);
  }

  Future<List> returnRank(String id) async {
    String urlRanked = baseUrl + RiotApi.rankedUrl;

    http.Response response =
        await http.get(urlRanked + id + "?" + "api_key=" + key);
    return json.decode(response.body);
  }

  String returnUrlImage(int idIcon) {
    return "http://ddragon.leagueoflegends.com/cdn/10.18.1/img/profileicon/$idIcon.png";
  }

  String returnUrlChampImage(String champName) {
    return "http://ddragon.leagueoflegends.com/cdn/10.18.1/img/champion/$champName.png";
  }
}
