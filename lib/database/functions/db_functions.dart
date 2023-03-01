import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_details/database/functions/add_student_button.dart';
import '../models/student_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);
final studentDB = Hive.box<StudentModel>("student_db");

Future<void> addStudent(StudentModel value) async {
  await studentDB.add(value);
  getAllStudents();
}

Future<void> getAllStudents() async {
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id, ctx) async {
  await studentDB.deleteAt(id);
  getAllStudents();
  snackBar(ctx, 'Deleted');
  Navigator.pop(ctx);
}

Future<void> updateStudent(int id, StudentModel value, ctx) async {
  await studentDB.putAt(id, value);
  getAllStudents();
  Navigator.pop(ctx);
  snackBar(ctx, 'updated');
}
