
import 'dart:convert';

import 'package:http/http.dart';

import '../ModelClass/MovieModel.dart';
import 'api_client.dart';




class MovieApi {
  ApiClient apiClient = ApiClient();


  Future<MovieModel> getMovie() async {
    String trendingpath = 'https://imdb-top-100-movies.p.rapidapi.com/top32';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return MovieModel.fromJson(jsonDecode(response.body));
  }
}