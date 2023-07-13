import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:httpexample/post/model/model.dart';

class PostService {
  Future<Posting> posting({
    required String name,
    required int age,
    required int salary,
  }) async {
    final result = await http.post(
      Uri.parse("https://dev-njhg2de2v1cq4mn.api.raw-labs.com/your/endpoint/2"),
      headers: <String, String>{'content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'age': age,
        'salary': salary,
      }),
    );
    if (result.statusCode == 200) {
      final value = Posting.fromJson(jsonDecode(result.body));
      // ignore: avoid_print
      print(value);
      return value;
    } else {
      throw Exception("failed to login");
    }
  }

 
}
