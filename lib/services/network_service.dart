
import 'dart:convert';


import 'package:http/http.dart';

class NetworkService{

  // URL
  static String baseUrl = 'jsonplaceholder.typicode.com';

  // HEADERS
  static Map<String, String> headers = {
    'Content-type' : 'application/json; charset=UTF-8'
  };


  // APIS

  static String apiPosts = '/posts';
  static String apiPost = '/posts/1';

  // GET

  static Future<String> GET(String api, Map<String, String> headers)async{
    Uri uri = Uri.https(baseUrl, api);
    Response response = await get(uri, headers: headers);
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }else{
      throw Exception('Error');
    }
  }

  // PUT

  static Future<String> PUT(String api, Map<String, String> headers, Map<String, dynamic> body) async {
    Uri uri = Uri.https(baseUrl, api);
    Response response = await put(uri, headers: headers, body: jsonEncode(body));
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }else{
      throw Exception('Error');
    }
  }

  // POST

  static Future<String> POST(String api, Map<String, String> headers, Map<String, dynamic> body) async{
    Uri uri = Uri.https(baseUrl, api);
    Response response = await post(uri, headers: headers, body: jsonEncode(body));
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }else{
      throw Exception('Error');
    }
  }

  // PATCH

  static Future<String> PUTCH(String api, Map<String, String> headers, Map<String, dynamic> body) async {
    Uri uri = Uri.https(baseUrl, api);
    Response response = await patch(uri, headers: headers, body: jsonEncode(body));
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }else{
      throw Exception('Error');
    }
  }

  // DELETE

  static Future<String> DELETE(String api, Map<String, String> headers)async{
    Uri uri = Uri.https(baseUrl, api);
    Response response = await delete(uri, headers: headers);
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }else{
      throw Exception('Error');
    }
  }

  // PARSING

}