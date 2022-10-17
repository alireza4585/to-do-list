import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note/data/task.dart';
import 'package:note/data/utility.dart';
import 'package:note/screen/home.dart';
import 'package:time_pickerr/time_pickerr.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final box = Hive.box<Task>('task');
  int indexx = 0;
  DateTime? _time;
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();
  final TextEditingController controllerTaskTitle = TextEditingController();
  final TextEditingController controllerTaskSubTitle = TextEditingController();
  @override
  void initState() {
    super.initState();
    negahban1.addListener(() {
      setState(() {});
    });

    negahban2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 44),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextField(
                          controller: controllerTaskTitle,
                          focusNode: negahban1,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            labelText: 'عنوان تسک',
                            labelStyle: TextStyle(
                              fontSize: 20,
                              color: negahban1.hasFocus
                                  ? Color(0xff18DAA3)
                                  : Color(0xffC5C5C5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  color: Color(0xffC5C5C5), width: 3.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                width: 3,
                                color: Color(0xff18DAA3),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 44),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextField(
                          controller: controllerTaskSubTitle,
                          maxLines: 2,
                          focusNode: negahban2,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            labelText: 'عنوان تسک',
                            labelStyle: TextStyle(
                              fontSize: 20,
                              color: negahban2.hasFocus
                                  ? Color(0xff18DAA3)
                                  : Color(0xffC5C5C5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  color: Color(0xffC5C5C5), width: 3.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                width: 3,
                                color: Color(0xff18DAA3),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: CustomHourPicker(
                        titleStyle: TextStyle(
                            color: Color(0xff18DAA3),
                            fontWeight: FontWeight.bold),
                        title: 'زمان تسک را انتخاب کنید',
                        negativeButtonText: 'حذف',
                        positiveButtonText: 'تایید',
                        positiveButtonStyle: TextStyle(
                          color: Color(0xff18DAA3),
                          fontWeight: FontWeight.bold,
                        ),
                        negativeButtonStyle: TextStyle(color: Colors.red),
                        elevation: 2,
                        onPositivePressed: (context, time) {
                          _time = time;
                        },
                        onNegativePressed: (context) {},
                      ),
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: getTaskTypeList().length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                indexx = index;
                              });
                            },
                            child: task_item(index),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  String taskTitle = controllerTaskTitle.text;
                  String taskSubTitle = controllerTaskSubTitle.text;
                  addtask(taskTitle, taskSubTitle);
                  Navigator.of(context).pop();
                },
                child: Text(
                  'اضافه کردن تسک',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff18DAA3),
                  minimumSize: Size(200, 48),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget task_item(int index) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: indexx == index ? Colors.green : Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 140,
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Image.asset(getTaskTypeList()[index].image),
          Text(getTaskTypeList()[index].title),
        ],
      ),
    );
  }

  addtask(String taskTitle, String subtitle) {
    var tasks =
        Task(taskTitle, subtitle, false, _time!, getTaskTypeList()[indexx]);
    box.add(tasks);
  }
}
