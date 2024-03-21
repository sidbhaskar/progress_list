import 'package:flutter/material.dart';

class ProgressInfoDialog extends StatefulWidget {
  const ProgressInfoDialog({super.key});

  @override
  State<ProgressInfoDialog> createState() => _ProgressDialoInfogState();
}

class _ProgressDialoInfogState extends State<ProgressInfoDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Text('Project Name'),
            Text('Project Desc'),
            Text('mermebers list'),
            Row(
              children: [
                Text('Todo List'),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Add new task'),
                )
              ],
            ),
            Column(
              children: [
                Text('Task 1'),
                Text('Task 2'),
                Text('Task 3'),
              ],
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.83,
              decoration: BoxDecoration(
                color: Colors.green.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
