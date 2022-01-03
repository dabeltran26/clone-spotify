import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:clone_spotify/models/playlist_model.dart';
import 'package:clone_spotify/utils/constants.dart';

class PlayListRepository {

  Future<PlayList> fetchPlayLists(String country,String authorization,String idCategory) async {

    String urlCat = "https://${Constants.baseUrlSpotify}/browse/categories/$idCategory/playlists?country=$country";

    Map<String, String> headers = {'Authorization': authorization, 'Content-Type': 'application/json'};

    final uri = Uri.parse(urlCat);
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      return PlayList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }

}