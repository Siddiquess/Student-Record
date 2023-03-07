import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/functions/provider/db_functions.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx1) => AlertDialog(
            title: const Text('Delete'),
            content: const Text('Do you want to delete?'),
            actions: [
              TextButton(
                  onPressed: () =>
                      Provider.of<StudentDatabse>(context, listen: false)
                          .deleteStudent(index, ctx1),
                  child: const Text('Yes')),
              TextButton(
                onPressed: () => Navigator.pop(ctx1),
                child: const Text('No'),
              )
            ],
          ),
        );
      },
      icon: const Icon(Icons.delete),
    );
  }
}
