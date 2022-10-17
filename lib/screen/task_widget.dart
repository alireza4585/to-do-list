import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note/data/task.dart';
import 'package:note/screen/edit_task.dart';

class Task_Widget extends StatefulWidget {
  Task t;
  int index;
  Task_Widget({super.key, required this.t, required this.index});

  @override
  State<Task_Widget> createState() => _Task_WidgetState();
}

class _Task_WidgetState extends State<Task_Widget> {
  bool isDone = false;
  @override
  void initState() {
    super.initState();
    isDone = widget.t.isDon;
  }

  @override
  Widget build(BuildContext context) {
    return get_main();
  }

  Widget get_main() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDone = !isDone;
          widget.t.isDon = isDone;
          widget.t.save();
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        height: 132,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(
                            value: isDone,
                            onChanged: (value) {
                              // setState(() {
                              //   isDone = value!;
                              // });
                            }),
                        Text(widget.t.title),
                      ],
                    ),
                    Text(widget.t.subtitle),
                    Spacer(),
                    bottoms(context),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Image.asset(widget.t.tasktype.image),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottoms(context) {
    return Row(
      children: [
        Container(
          width: 90,
          height: 28,
          decoration: BoxDecoration(
            color: Color(0xff18DAA3),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              children: [
                Text(
                  '${widget.t.time.hour}:${widget.t.time.minute}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 10),
                Image.asset('images/icon_time.png'),
              ],
            ),
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditTaskScreen(
                      index: widget.index,
                      t: widget.t,
                    )));
          },
          child: Container(
            width: 90,
            height: 28,
            decoration: BoxDecoration(
              color: Color(0xffE2F6F1),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Row(
                children: [
                  Text('ویرایش'),
                  SizedBox(width: 10),
                  Image.asset('images/icon_edit.png'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
