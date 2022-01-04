import 'dart:async';
import 'dart:convert';
import 'package:clone_spotify/models/authorization_model.dart';
import 'package:clone_spotify/models/categories_model.dart';
import 'package:clone_spotify/utils/constants.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  final String baseUrl;

  HomeRepository({this.baseUrl = Constants.baseUrlSpotifyAccessToken});

  static String? accessUrl = "https://"+Constants.baseUrlSpotifyAccessToken;
  static String? redirect_uri = "clone-spotify-home://callback";

  final callbackUrlScheme = 'clone-spotify-home';

  var usersBox = Hive.box('spotify');

  Future<String> fetchCode() async {

    String urlCode = accessUrl!  + '/authorize'+
        "?client_id=${Constants.clientId}" +
        "&response_type=code" +
        "&redirect_uri=$redirect_uri";

    final response = await FlutterWebAuth.authenticate(
        url: urlCode, callbackUrlScheme: callbackUrlScheme);
    final error = Uri.parse(response).queryParameters['error'];
    if (error == null) {
      final code = Uri.parse(response).queryParameters['code'];
      return code!;
    } else {
      return error;
    }
  }

  Future<AuthorizationModel> getAccessTokenSpotify(String code) async {

    String authorizationStr = "${Constants.clientId}:${Constants.clientSecret}";
    var bytes = utf8.encode(authorizationStr);
    var base64Str = base64.encode(bytes);

    String authorization = 'Basic ' + base64Str;

    String urlToken = accessUrl!  + '/api/token'+
        "?grant_type=authorization_code" +
        "&code=$code" +
        "&redirect_uri=$redirect_uri";

    Map<String, String> headers = {'Authorization': authorization, 'Content-Type': 'application/x-www-form-urlencoded'};

    final uri = Uri.parse(urlToken);
    final response = await http.post(uri, headers: headers);

    if (response.statusCode == 200) {
      return AuthorizationModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }

  Future<Categories> fetchCategories(String country,String authorization) async {

    String urlCat = "https://${Constants.baseUrlSpotify}/browse/categories?country=$country&locale=sv_$country";

    Map<String, String> headers = {'Authorization': authorization, 'Content-Type': 'application/json'};

    final uri = Uri.parse(urlCat);
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      return Categories.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }

  void refreshToken() async {
      print('refresh token');
      String authorizationStr = "${Constants.clientId}:${Constants.clientSecret}";
      var bytes = utf8.encode(authorizationStr);
      var base64Str = base64.encode(bytes);
      String authorization = 'Basic ' + base64Str;
      String urlToken = accessUrl!  + '/api/token'+
          "?grant_type=refresh_token" +
          "&refresh_token=${ usersBox.get('refreshToken')}" +
          "&redirect_uri=$redirect_uri";

      Map<String, String> headersRefresh = {'Authorization': authorization, 'Content-Type': 'application/x-www-form-urlencoded'};
      final uriRefresh = Uri.parse(urlToken);
      final responseNewToken = await http.post(uriRefresh, headers: headersRefresh);
      AuthorizationModel tokenRefresh =  AuthorizationModel.fromJson(json.decode(responseNewToken.body));
      usersBox.put('accessToken', tokenRefresh.accessToken);
      usersBox.put('tokenType', tokenRefresh.tokenType);
  }
}
