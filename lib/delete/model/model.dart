

class Delete {
    int id;
    String name;
    int age;
    int salary;

    Delete({
        required this.id,
        required this.name,
        required this.age,
        required this.salary,
    });

    factory Delete.fromJson(Map<String, dynamic> json) => Delete(
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
