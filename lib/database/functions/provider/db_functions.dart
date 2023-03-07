import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_details/database/functions/add_student_button.dart';
import '../../models/student_model.dart';

class StudentDatabse with ChangeNotifier {
 static List<StudentModel> studentListData = [];
  final studentDB = Hive.box<StudentModel>("student_db");

  Future<void> addStudent(StudentModel value) async {
    await studentDB.add(value);
    getAllStudents();
  }

  Future<void> getAllStudents() async {
    studentListData.clear();
    studentListData.addAll(studentDB.values);
    notifyListeners();
  }

  Future<void> deleteStudent(int id, ctx) async {
    await studentDB.deleteAt(id);
    getAllStudents();
    snackBar(ctx, 'Deleted Successflully');
    Navigator.pop(ctx);
  }

  Future<void> updateStudent(int id, StudentModel value, ctx) async {
    await studentDB.putAt(id, value);
    getAllStudents();
    Navigator.pop(ctx);
    snackBar(ctx, 'Updated Successflully');
  }
}
