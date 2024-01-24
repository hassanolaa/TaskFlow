import 'package:todo_list/model/Task.dart';
import 'package:todo_list/model/sqlite.dart';

class DBhelper extends database {
  getAllTasks() async{
    List<Task> tasks = [];
    String sql = "SELECT * FROM TASK";
    List<Map> myMap =await inquiry(sql);
    for (int i = 0; i < myMap.length; i++) {
      tasks.add(Task.fromJson(myMap[i]));
    }
    return tasks;
  }

  InsertNewTask(Task task)async {
    String sql = '''
       INSERT INTO TASK(taskname,contant,category,done)
       VALUES('${task.taskname}','${task.contant}','${task.category}','${task.done}')
      ''';
    int result =await insert(sql);
    print(result);
    return result;
  }

 DeleteTask(Task task)async {
    String sql = '''
       DELETE FROM TASK 
       WHERE 
       id = ${task.id}
      ''';
    int result =await delete(sql);
    print(result);
    return result;
  }

  UpdateTask(Task task)async {
    String sql = '''
       UPDATE TASK SET taskname = '${task.taskname}',contant = '${task.contant}',category = '${task.category}',done = '${task.done}' WHERE id = ${task.id}
      ''';
    int result =await update(sql);
    print(result);
    return result;
  }

}
