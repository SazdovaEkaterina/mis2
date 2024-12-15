import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService{

  static Future<http.Response> getJokeFromJokeAPI() async {
    var response = await http.get(Uri.parse("https://jokeapi.co/api/v2/joke?limit=250"));
    print("Response: ${response.body}");
    return response;
  }
  
  static Future<dynamic> getAbilitiesForJoke(String id) async{
    final response = await http.get(Uri.parse("https://jokeapi.co/api/v2/joke/$id"));
    if (response.statusCode == 200) {
      print("Success: ${response.body}");
      var data = jsonDecode(response.body);
      print("data $data");
      return data;
    }
    else{
      throw Exception("Failed to load data!");
    }
  }
}