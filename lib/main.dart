import 'package:flutter/material.dart';
import 'package:note/data/task_type.dart';
import 'package:note/data/type_enum.dart';
import 'package:note/screen/add_tast.dart';
import 'package:note/screen/home.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/task.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TskeTypeAdapter());
  Hive.registerAdapter(TaskTypeEnumAdapter());
  await Hive.openBox<Task>('task');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'sh',
        textTheme: TextTheme(
          headline4: TextStyle(
            fontFamily: 'sh',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
