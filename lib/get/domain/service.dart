import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/model.dart';

class Service {
  Future<List<User>> getdata() async {
    final value = await http.get(
        Uri.parse("https://dev-njhg2de2v1cq4mn.api.raw-labs.com/your/endpoint/2"));
    if (value.statusCode == 200) {
      final List<dynamic> newUser = jsonDecode(value.body);
      final userInfo = newUser.map(
        (e) {
          return User(
            id: e["id"],
            name: e["name"],
            age: e["age"],
            salary: e["salary"],
          );
        },
      ).toList();
      return userInfo;
    } else {
      throw Exception("error");
    }
  }
}
