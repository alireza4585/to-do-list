import 'package:note/data/task_type.dart';
import 'package:note/data/type_enum.dart';

List<TskeType> getTaskTypeList() {
  var list = [
    TskeType(
      'images/meditate.png',
      'تمرکز',
      TaskTypeEnum.foucs,
    ),
    TskeType(
      'images/work_meeting.png',
      'میتینگ',
      TaskTypeEnum.date,
    ),
    TskeType(
      'images/hard_working.png',
      'کار',
      TaskTypeEnum.working,
    ),
  ];
  return list;
}
