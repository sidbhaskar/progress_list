import 'package:flutter/material.dart';

class ProgressCard extends StatefulWidget {
  String projectname;
  String projectDesc;
  final Function onDelete;

  ProgressCard({
    required this.projectDesc,
    required this.projectname,
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  State<ProgressCard> createState() => ProgressCardState();
}

class ProgressCardState extends State<ProgressCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white10,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 5.0, left: 18, right: 1, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.projectname,
                        style: TextStyle(color: Colors.white70, fontSize: 20),
                      ),
                      IconButton(
                        onPressed: () {
                          widget.onDelete(); // Call onDelete callback
                        },
                        icon: Icon(Icons.delete),
                        color: Colors.white60,
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 7.0, left: 18, right: 18, bottom: 4),
                    child: Container(
                      height: 70,
                      child: Text(
                        widget.projectDesc,
                        style: TextStyle(color: Colors.white60),
                      ),
                    ),
                  ),
                ),
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
