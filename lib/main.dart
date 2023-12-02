import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/counter.dart';
import 'package:to_do_app/widgets/todo_card.dart';

// class for task(todo-card)
class Task {
  String title;
  bool status;
  Task({required this.title, required this.status});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: ToDoApp(),
    );
  }
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  String taskText = "";

  // create controll to get the text from textfield
  final myController = TextEditingController();

  // List of todos
  List allTasks = [
    Task(title: "Create ur first task !", status: false),
  ];

  // to remove todo when click on 'delete' button
  deleteTask(int taskIndex) {
    setState(() {
      allTasks.remove(allTasks[taskIndex]);
    });
  }

  // to change todo status (completed or not) when click on todo widget
  changeStatus(int taskIndex) {
    setState(() {
      allTasks[taskIndex].status = !allTasks[taskIndex].status;
    });
  }

  // to check how many todos are done for the counter
  int checkDone() {
    int howManyDone = 0;
    allTasks.forEach((item) {
      if (item.status) {
        howManyDone++;
      }
    });
    return howManyDone;
  }

  // to add new task when after clicking on the floating action button and then 'add task' button
  addNewTask() {
    setState(() {
      allTasks.add(Task(title: myController.text, status: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: Container(
                    height: 200,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          maxLength: 50,
                          decoration: InputDecoration(
                            hintText: "Add a Task",
                          ),
                          controller: myController,
                        ),
                        SizedBox(height: 20),
                        TextButton(
                            onPressed: () {
                              addNewTask();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Add Task",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.amber[800]),
                            ))
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                );
              },
            );
          },
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.amberAccent[700],
        ),
        backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(58, 66, 86, 1),
          title: Text(
            "TO DO APP",
            style: TextStyle(
                color: Colors.orange,
                fontSize: 28,
                fontWeight: FontWeight.w600),
          ),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    allTasks.clear();
                  });
                },
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.red[500],
                  size: 31,
                ))
          ],
        ),
        body: SizedBox(
            width: double.infinity,
            child: FractionallySizedBox(
              widthFactor: 0.939,
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Counter(
                    allTasksNum: allTasks.length, doneTasksNum: checkDone()),
                SizedBox(
                  height: 650,
                  child: ListView.builder(
                      itemCount: allTasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            TodoCard(
                                // here we pass info to create the todo_card widget from "todo_card.dart"
                                varTitle: allTasks[index].title,
                                varStatus: allTasks[index].status,
                                myFunc: changeStatus,
                                xTaskIndex: index,
                                delete: deleteTask
                                )
                            // ...allTasks
                            //     .map((item) => TodoCard(
                            //         varTitle: item.title, varStatus: item.status))
                            //     .toList()
                          ],
                        );
                      }),
                )
              ]),
            )
            )
    );
  }
}


// showModalBottomSheet (isScrollControlled: true)