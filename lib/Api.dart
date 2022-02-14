import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/Video.dart';

//const CHAVE_YOUTUBE_API = "AIzaSyBrQSLDqhY4II3lRaYHkCEW5zfNOQtsGZc";
const CHAVE_YOUTUBE_API = "AIzaSyAtu-tjLspAxkYD5RJ4YMgLJC5NLv363KQ";
const ID_CANAL = "";
//UCGo3vjM2Ll3XujL-zYT5SMg

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(Uri.parse(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&type=video&maxResults=20&order=date&key=$CHAVE_YOUTUBE_API&channelId=$ID_CANAL&q=$pesquisa"));

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
        //return Video.converterJson(map);
      }).toList();

      return videos;

      //print("Resultado: " + videos.toString() );

      /*
      for( var video in dadosJson["items"] ){
        print("Resultado: " + video.toString() );
      }*/
      //print("resultado: " + dadosJson["items"].toString() );

    } else {}
  }
}
