import 'package:flutter/material.dart';
import 'package:student_details/database/functions/db_functions.dart';
import '../database/models/student_model.dart';
import '../widgets/text_form_field.dart';

class EditStudent extends StatefulWidget {
  const EditStudent(
      {super.key,
      required this.name,
      required this.age,
      required this.email,
      required this.phone,
      required this.index});
  final String name;
  final String age;
  final String email;
  final String phone;
  final int index;
  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final formValidateKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController.text = widget.name;
    ageController.text = widget.age;
    emailController.text = widget.email;
    phoneController.text = widget.phone;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Student'),
        centerTitle: true,
      ),
      body: Form(
        key: formValidateKey,
        child: ListView(
          children: [
            SingleChildScrollView(
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
                  ),
                  // -------------- Button -------------- //
                  ElevatedButton(
                    onPressed: () {
                      if (formValidateKey.currentState!.validate()) {
                        final value = StudentModel(
                          name: nameController.text,
                          age: ageController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                        );
                        updateStudent(widget.index, value, context);
                      }
                    },
                    child: const Text('Update Student'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
