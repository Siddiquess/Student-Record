import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_details/database/functions/provider/db_functions.dart';
import 'package:student_details/screens/single_student.dart';
import 'package:student_details/widgets/delete_button.dart';
import 'package:student_details/widgets/edit_button.dart';

class StudentListBuilder extends StatelessWidget {
  const StudentListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentDatabse>(
      builder: (context, studentList, child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final data = StudentDatabse.studentListData[index];
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
          itemCount: StudentDatabse.studentListData.length,
        );
      },
    );
  }
}
