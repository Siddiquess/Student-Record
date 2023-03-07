import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_details/database/functions/provider/db_functions.dart';
import 'package:student_details/screens/add_student.dart';
import '../models/student_model.dart';

class AddStudentButton extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const AddStudentButton({
    super.key,
    required this.nameController,
    required this.ageController,
    required this.emailController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: ElevatedButton(
        onPressed: () {
          if (validateKey.currentState!.validate()) {
            addStudentButtonClick(
              context: context,
              nameController: nameController,
              ageController: ageController,
              emailController: emailController,
              phoneController: phoneController,
            );
          }
        },
        child: const Text("Submit"),
      ),
    );
  }

  Future addStudentButtonClick({
    required context,
    required TextEditingController nameController,
    required TextEditingController ageController,
    required TextEditingController emailController,
    required TextEditingController phoneController,
  }) async {
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
}

// ============= Snack Bar =============== //

void snackBar(BuildContext context, String info) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      width: MediaQuery.of(context).size.width * 0.6,
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
