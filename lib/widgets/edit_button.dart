import 'package:flutter/material.dart';
import 'package:student_details/database/models/student_model.dart';
import '../screens/edit_student.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.data,
    required this.index,
  });
  final StudentModel data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditStudent(
              name: data.name,
              age: data.age,
              email: data.email,
              phone: data.phone,
              index: index,
            ),
          ),
        );
      },
      icon: const Icon(Icons.edit),
    );
  }
}
