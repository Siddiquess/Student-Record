import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String validateText;
  final TextInputType keyType;
  final bool isEmail;
  final bool isPhone;

  const TextFormWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.validateText,
    required this.keyType,
    this.isEmail = false,
    this.isPhone = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        keyboardType: keyType,
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              isEmail && !EmailValidator.validate(value) ||
              isPhone && value.length != 10) {
            return validateText;
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: labelText),
      ),
    );
  }
}
