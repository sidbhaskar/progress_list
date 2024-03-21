import 'package:flutter/material.dart';
import 'package:progress_list/progress.dart';

import 'progress_card.dart';
import 'progress_info_dialog.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final List<ProjectData> projects = [];

  final pNameController = TextEditingController();
  final pDescController = TextEditingController();

  void newProjectDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Create a New Project',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: pNameController,
                    decoration: InputDecoration(
                      label: Text('Name'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: pDescController,
                    decoration: InputDecoration(
                      label: Text('Description'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        projects.add(ProjectData(
                          projectName: pNameController.text,
                          projectDesc: pDescController.text,
                        ));
                      });
                      Navigator.pop(context);
                      pNameController.clear();
                      pDescController.clear();
                    },
                    child: Text('Submit'))
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress bar'),
      ),
      backgroundColor: Color(0xff18181b),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffa1a1aa),
        onPressed: () {
          newProjectDialog();
        },
        child: Icon(Icons.add),
        shape: CircleBorder(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: projects.length,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ProgressInfoDialog();
                        },
                      );
                    },
                    child: ProgressCard(
                      projectname: projects[index].projectName,
                      projectDesc: projects[index].projectDesc,
                      onDelete: () {
                        setState(() {
                          projects.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
