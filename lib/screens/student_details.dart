import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_details/database/functions/provider/db_functions.dart';
import 'package:student_details/database/functions/student_list.dart';
import 'package:student_details/screens/add_student.dart';
import 'package:student_details/screens/search_field.dart';

class StudentDetails extends StatelessWidget {
  const StudentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Provider.of<StudentDatabse>(context, listen: false).getAllStudents();
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Students Record'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchField(),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Consumer<StudentDatabse>(
        builder: (context, value, child) {
          return value.studentDB.isEmpty
              ? const Center(child: Text("No data found"))
              : const StudentListBuilder();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.person_add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  AddStudentData(),
            ),
          );
        },
      ),
    );
  }
}
