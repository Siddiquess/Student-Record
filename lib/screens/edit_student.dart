import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:student_details/functions/db_functions.dart';
import 'package:student_details/models/student_model.dart';

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
            Column(
              children: [
                // -------------- TextField 1 -------------- //
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: 'Name of Student'),
                  ),
                ),
                // -------------- TextField 2 -------------- //
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Age is required';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: 'Age'),
                  ),
                ),
                // -------------- TextField 3 -------------- //
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: emailController,
                    validator: (email) {
                      if (email != null && !EmailValidator.validate(email)) {
                        return 'Enter valid email';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: 'Email address'),
                  ),
                ),
                // -------------- TextField 4 -------------- //
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: phoneController,
                     keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length != 10) {
                        return 'Enter valid number';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixText:'+91' ,
                        prefixStyle: const TextStyle(color: Colors.black,fontSize: 16),
                        labelText: 'Phone'),
                  ),
                ),
                // -------------- Button -------------- //
                ElevatedButton(
                    onPressed: () {
                      if (formValidateKey.currentState!.validate()) {
                        final value = StudentModel(
                            name: nameController.text,
                            age: ageController.text,
                            email: emailController.text,
                            phone: phoneController.text);
                        updateStudent(widget.index, value, context);
                      }
                    },
                    child: const Text('Update Student'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
