import 'package:hive/hive.dart';
import 'package:note/data/type_enum.dart';
part 'task_type.g.dart';

@HiveType(typeId: 2)
class TskeType {
  TskeType(this.image, this.title, this.taskTypeEnum);
  @HiveField(0)
  String image;
  @HiveField(1)
  String title;
  @HiveField(2)
  TaskTypeEnum taskTypeEnum;
}
