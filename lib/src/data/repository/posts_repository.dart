import 'dart:convert';

import 'package:http/http.dart' as http;

class PostsRepository {

  Future<Map<String, dynamic>> findAll() async{

    var url = Uri.parse('http://localhost:8084/postsList');
    var future = http.get(url);
    var response = await future;
    var responseBody = utf8.decode(response.bodyBytes);

    print('Response status : ${response.statusCode}');
    print('Response body : ${utf8.decode(response.bodyBytes)}');

    // return jsonDecode(response.body);
    return jsonDecode(responseBody);

  }
}