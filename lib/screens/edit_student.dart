import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_details/database/functions/db_functions.dart';
import '../database/models/student_model.dart';
import '../widgets/text_form_field.dart';

class EditStudent extends StatelessWidget {
   EditStudent(
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
  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final formValidateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      nameController.text = name;
      ageController.text = age;
      emailController.text = email;
      phoneController.text = phone;
    });
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
                    isPhone: true,
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
                        Provider.of<StudentDatabse>(context, listen: false)
                            .updateStudent(index, value, context);
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
