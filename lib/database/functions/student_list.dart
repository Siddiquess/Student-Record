import 'package:flutter/material.dart';
import 'package:student_details/database/functions/db_functions.dart';
import 'package:student_details/screens/single_student.dart';
import 'package:student_details/widgets/delete_button.dart';
import 'package:student_details/widgets/edit_button.dart';
import '../models/student_model.dart';

class StudentListBuilder extends StatelessWidget {
  const StudentListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (context, List<StudentModel> studentList, child) {
        return ListView.separated(
            itemBuilder: (context, index) {
              final data = studentList[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingleStudent(data),
                    ),
                  );
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
                    EditButton(
                      data: data,
                      index: index,
                    ),
                    DeleteButton(index: index),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: studentList.length);
      },
    );
  }
}
