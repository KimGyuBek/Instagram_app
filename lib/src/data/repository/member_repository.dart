import 'dart:convert';

import 'package:http/http.dart' as http;

class MemberRepository {

  /*{userId}로 조회*/
  Future<Map<String, dynamic>> findByUserId(String userId) async {
    var url = Uri.parse('http://localhost:8084/memberinfo/$userId');
    var future = http.get(url);
    var response = await future;
    var responsebody = utf8.decode(response.bodyBytes);

    print('Response status : ${response.statusCode}');
    print('Response body : ${utf8.decode(response.bodyBytes)}');

    return jsonDecode(responsebody);
  }





}