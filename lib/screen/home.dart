import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note/data/task.dart';
import 'package:note/screen/add_tast.dart';
import 'package:note/screen/task_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

bool isCheched = false;
var box = Hive.box<Task>('task');
int indexx = 0;
bool fa = true;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: fa,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddTask()));
          },
          backgroundColor: Color(0xff18DAA3),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      backgroundColor: Color(0xffE5E5E5),
      body: SafeArea(
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: box.listenable(),
            builder: (BuildContext context, dynamic value, Widget? child) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notif) {
                  if (notif.direction == ScrollDirection.forward) {
                    setState(() {
                      fa = true;
                    });
                  }
                  if (notif.direction == ScrollDirection.reverse) {
                    setState(() {
                      fa = false;
                    });
                  }
                  return true;
                },
                child: ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (BuildContext context, int index) {
                    var taskss = box.values.toList()[index];
                    return getListitem(taskss, index);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget getListitem(Task taskss, int index) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        taskss.delete();
      },
      child: Task_Widget(t: taskss, index: index),
    );
  }
}
