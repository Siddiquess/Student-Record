import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_details/database/functions/db_functions.dart';
import 'package:student_details/screens/single_student.dart';
import '../database/models/student_model.dart';

class SearchField extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<StudentDatabse>(
      builder: ((context, studentList, child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = StudentDatabse.studentListData[index];
            if (data.name.toLowerCase().contains(
                  query.toLowerCase(),
                )) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return SingleStudent(data);
                          }),
                        ),
                      );
                    },
                    title: Text(data.name),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                  ),
                  const Divider()
                ],
              );
            } else {
              return Container();
            }
          },
          itemCount: StudentDatabse.studentListData.length,
        );
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer<StudentDatabse>(
      builder: (( context,  studentList,
         child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = StudentDatabse.studentListData[index];
            if (data.name.toLowerCase().contains(query.toLowerCase())) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) {
                            return SingleStudent(data);
                          }),
                        ),
                      );
                    },
                    title: Text(data.name),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                  ),
                  const Divider()
                ],
              );
            } else {
              return Container();
            }
          },
          itemCount: StudentDatabse.studentListData.length,
        );
      }),
    );
  }
}
