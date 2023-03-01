import 'package:flutter/material.dart';
import 'package:student_details/widgets/text_form_field.dart';
import '../database/functions/add_student_button.dart';

final validateKey = GlobalKey<FormState>();

class AddStudentData extends StatelessWidget {
  AddStudentData({
    super.key,
  });

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: SafeArea(
        child: Form(
          key: validateKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // -------------- TextField 1 -------------- //
                TextFormWidget(
                  controller: nameController,
                  labelText: "Name of student",
                  validateText: "Name is required",
                  keyType: TextInputType.name,
                ),
                // -------------- TextField 2 -------------- //
                TextFormWidget(
                  controller: ageController,
                  labelText: 'Age',
                  validateText: "Age is required",
                  keyType: TextInputType.number,
                ),
                // -------------- TextField 3 -------------- //
                TextFormWidget(
                  controller: emailController,
                  labelText: 'Email Address',
                  validateText: "Enter valid email",
                  keyType: TextInputType.emailAddress,
                  isEmail: true,
                ),
                // -------------- TextField 4 -------------- //
                TextFormWidget(
                  controller: phoneController,
                  labelText: "Phone Number",
                  validateText: 'Enter valid number',
                  keyType: TextInputType.number,
                  isPhone: true,
                ),
                // -------------- Button -------------- //
                AddStudentButton(
                  nameController: nameController,
                  ageController: ageController,
                  emailController: emailController,
                  phoneController: phoneController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
