import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';

import 'api_exception.dart';

class ApiClient {
  Future<Response> invokeAPI(String path, String method, Object? body) async {
    Map<String, String> headerParams = {};
    Response response;

    String url = path;
    print(url);

    final nullableHeaderParams = (headerParams.isEmpty) ? null : headerParams;
    print(body);
    switch (method) {
      case "POST":
        response = await post(Uri.parse(url),
            headers: {
              'content-Type': 'application/x-www-form-urlencoded',
            },
            body: body);

        break;
      case "PUT":
        response = await put(Uri.parse(url),
            headers: {
              'content-Type': 'application/json',
            },
            body: body);
        break;
      case "DELETE":
        response = await delete(Uri.parse(url), headers: {}, body: body);
        break;
      case "POST_":
        response = await post(
          Uri.parse(url),
          headers: {'content-Type': 'application/json'},
          body: body,
        );
        break;
      case "GET_":
        response = await post(
          Uri.parse(url),
          headers: {},
          body: body,
        );
        break;
      case "GET":
        response = await get(
          Uri.parse(url),
          headers: {
            'X-RapidAPI-Key':
            '8535032e44msh1b50b56f6a92ce7p17aaacjsne6ebbb83df01',
            'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com',


            'Accept': 'application/json',
            'Content-Type': 'application/json'
          },
        );

        break;
      case "PATCH":
        response = await patch(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: body,
        );
        break;
      case "PATCH1":
        response = await patch(
          Uri.parse(url),
          headers: {},
          body: body,
        );
        break;
      default:
        response = await get(Uri.parse(url), headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });
    }

    print('status of $path =>' + (response.statusCode).toString());
    print(response.body);
    if (response.statusCode >= 400) {
      log(path +
          ' : ' +
          response.statusCode.toString() +
          ' : ' +
          response.body);

      throw ApiException(_decodeBodyBytes(response), response.statusCode);
    }
    return response;
  }

  String _decodeBodyBytes(Response response) {
    var contentType = response.headers['content-type'];
    if (contentType != null && contentType.contains("application/json")) {
      return jsonDecode(response.body)['message'];
    } else {
      return response.body;
    }
  }
}