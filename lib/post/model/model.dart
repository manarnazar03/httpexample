// To parse this JSON data, do
//
//     final posting = postingFromJson(jsonString);

import 'dart:convert';

List<Posting> postingFromJson(String str) => List<Posting>.from(json.decode(str).map((x) => Posting.fromJson(x)));

String postingToJson(List<Posting> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posting {
    int id;
    String name;
    int age;
    int salary;

    Posting({
        required this.id,
        required this.name,
        required this.age,
        required this.salary,
    });

    factory Posting.fromJson(Map<String, dynamic> json) => Posting(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        salary: json["salary"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "salary": salary,
    };
}
