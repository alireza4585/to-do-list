import 'package:hive/hive.dart';
import 'package:note/data/task_type.dart';
part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(1)
  String title;
  @HiveField(2)
  String subtitle;
  @HiveField(3)
  bool isDon;
  @HiveField(4)
  DateTime time;
  @HiveField(5)
  TskeType tasktype;
  Task(this.title, this.subtitle, this.isDon, this.time, this.tasktype);
}
