import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String varTitle;
  final bool varStatus;
  final Function myFunc;
  final int xTaskIndex;
  final Function delete;
  const TodoCard(
      {super.key,
      required this.varTitle,
      required this.varStatus,
      required this.myFunc,
      required this.xTaskIndex,
      required this.delete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myFunc(xTaskIndex);
      },
      child: Container(
        margin: EdgeInsets.only(top: 21),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Color.fromRGBO(209, 224, 224, 0.2),
            borderRadius: BorderRadius.circular(11)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(varTitle, style: TextStyle(
              color: varStatus ? Colors.black : Colors.white,
              decoration: varStatus ? TextDecoration.lineThrough : TextDecoration.none,
              fontSize: 20
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  // Icons.done,
                  varStatus ? Icons.done : Icons.close,
                  color: varStatus ? Colors.green : Colors.red,
                  size: 27,
                ),
                SizedBox(
                  width: 15,
                ),
                IconButton(
                  onPressed: () {
                    delete(xTaskIndex);
                  },
                  icon: Icon(Icons.delete),
                  color: Colors.red[100],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
