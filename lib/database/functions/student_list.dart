import 'package:flutter/material.dart';
import 'package:student_details/database/functions/db_functions.dart';
import 'package:student_details/screens/edit_student.dart';
import 'package:student_details/screens/single_student.dart';

import '../models/student_model.dart';



class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder: (BuildContext context, List<StudentModel> studentList,
            Widget? child) {
          return ListView.separated(
              itemBuilder: (context, index) {
                final data = studentList[index];

                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => SingleStudent(data))));
                  },
                  leading: const CircleAvatar(
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                  title: Text(data.name),
                  subtitle: Text(data.email),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => EditStudent(
                                          name: data.name,
                                          age: data.age,
                                          email: data.email,
                                          phone: data.phone,
                                          index: index,
                      ))));
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            deleteCheck(index, context);
                          },
                          icon: const Icon(Icons.delete)),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: studentList.length);
        });
  }

  void deleteCheck(index, ctx) {
    showDialog(
        context: ctx,
        builder: (ctx1) => AlertDialog(
              title: const Text('Delete'),
              content: const Text('Do you want to delete?'),
              actions: [
                TextButton(
                    onPressed: () => deleteStudent(index, ctx1),
                    child: const Text('Yes')),
                TextButton(
                    onPressed: () => Navigator.pop(ctx1),
                    child: const Text('No'))
              ],
            ));
  }
}
