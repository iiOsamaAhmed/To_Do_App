import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int allTasksNum;
  final int doneTasksNum;
  const Counter(
      {super.key, required this.allTasksNum, required this.doneTasksNum});

  @override
  Widget build(BuildContext context) {
    return Text("${doneTasksNum} / ${allTasksNum}",
        style: TextStyle (
          color: doneTasksNum == allTasksNum ? Colors.greenAccent[200] : Colors.white,
          // color: Colors.greenAccent[200], 
          // color: Colors.white, 
          fontSize: 50
        )
      );
  }
}
