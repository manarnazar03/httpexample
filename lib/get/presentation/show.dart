import 'package:flutter/material.dart';
import 'package:httpexample/delete/domain/service.dart';
import 'package:httpexample/get/domain/service.dart';
import 'package:httpexample/post/presentation/view.dart';

import '../model/model.dart';

class Show extends StatefulWidget {
  const Show({Key? key}) : super(key: key);

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  List<User> user = [];

  @override
  void initState() {
    super.initState();
    fetching();
  }

  Future<void> fetching() async {
    final data = await Service().getdata();
    setState(() {
      user = data.cast<User>();
    });
  }

  Future<void> deleteUser(int index) async {
    // Perform the delete operation using HTTP DELETE
    final userId = user[index].id;
    await DeleteService().deleteUser(userId);

    setState(() {
      user.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GET"),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ViewPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: user.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 16.0),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              deleteUser(index);
            },
            child: Card(
              child: ListTile(
                leading: CircleAvatar(child: Text(user[index].id.toString())),
                title: Text(
                  user[index].name,
                  style: const TextStyle(fontSize: 40),
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      user[index].age.toString(),
                      style: const TextStyle(fontSize: 25),
                    ),
                    Text(
                      user[index].salary.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Confirm Deletion'),
                          content: const Text('Are you sure you want to delete this item?'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Delete'),
                              onPressed: () {
                                deleteUser(index);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
