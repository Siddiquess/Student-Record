import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_details/database/functions/db_functions.dart';
import 'package:student_details/screens/add_student.dart';

import '../models/student_model.dart';

Future addStudentButtonClick(BuildContext context) async {
  final name = nameController.text.trim();
  final age = ageController.text.trim();
  final email = emailController.text.trim();
  final phone = phoneController.text.trim();

  final student = StudentModel(
    name: name,
    age: age,
    email: email,
    phone: phone,
  );
  Provider.of<StudentDatabse>(context, listen: false).addStudent(student);
  snackBar(context, 'Student Added');

  nameController.clear();
  ageController.clear();
  emailController.clear();
  phoneController.clear();

  Navigator.pop(context);
}

// ============= Snack Bar =============== //

void snackBar(BuildContext context, String info) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      width: MediaQuery.of(context).size.width * 0.5,
      behavior: SnackBarBehavior.floating,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      content: SizedBox(
        height: 25,
        child: Center(
          child: Text(
            info,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 19,
            ),
          ),
        ),
      ),
    ),
  );
}
