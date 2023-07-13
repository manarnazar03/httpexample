import 'package:flutter/material.dart';
import 'package:httpexample/post/domain/service.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController salary = TextEditingController();
 
  Future<void> fetchData(context) async {
    try {
      await PostService().posting(
        name: name.text,
        age: int.parse(age.text),
        salary: int.parse(salary.text),
       
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("User added successfully"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
    await clear();
  }

  Future<void> clear() async {
    name.clear();
    age.clear();
    salary.clear();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POST"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name",
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: age,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Age",
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: salary,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Salary",
                  ),
                ),
              ),
             
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    fetchData(context);
                  },
                  child: const Text("SAVE"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
