import 'package:http/http.dart' as http;
import '../modelos/Posts.dart';
import 'dart:convert';

Future<List<Posts>> pegarPosts() async {
  var response = await http.get("https://jsonplaceholder.typicode.com/posts");
  return postsFromJson(response.body);
}

Future deletarPost(String id) async {
  var response = await http.delete(
    "https://jsonplaceholder.typicode.com/posts/$id",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    //return Posts.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete.');
  }
}

Future atualizarPost(String post, String id) async {
  var response =
      await http.put("https://jsonplaceholder.typicode.com/posts/$id",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'body': post,
          }));
  print(response.statusCode);
  if (response.statusCode == 200) {
    //return Posts.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete.');
  }
}
