import 'dart:convert';
import 'package:clone_spotify/models/authorization_model.dart';
import 'package:clone_spotify/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final String baseUrl;

  UserRepository({this.baseUrl = Constants.baseUrlSpotifyAccessToken});

  Future<AuthorizationModel> getAccessTokenSpotify() async {
    String authorizationStr = "${Constants.clientId}:${Constants.clientSecret}";
    var bytes = utf8.encode(authorizationStr);
    var base64Str = base64.encode(bytes);

    String authorization = 'Basic ' + base64Str;

    var body = {
      'grant_type': "authorization_code",
      'code': '',
      'redirect_uri': 'alarmfy:/'
    };

    final headers = {'Authorization': authorization};
    final uri = Uri.parse('https://$baseUrl/api/token');
    final response = await http.post(uri, headers: headers, body: json.encode(body));

    if (response.statusCode == 200) {
      return AuthorizationModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }
}
