
class User {
    int id;
    String name;
    int age;
    int salary;

    User({
        required this.id,
        required this.name,
        required this.age,
        required this.salary,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
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
