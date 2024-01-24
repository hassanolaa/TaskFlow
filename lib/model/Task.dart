class Task {
  
  int? id;
  String? taskname;
  String? contant;
  int? category;
  int? done;
  
  Task({this.id, this.taskname, this.contant, this.category, this.done});


   factory Task.getNewEmpty(){
    return Task(id:0, taskname:"", contant: "", category: 0, done: 0);
   }




  factory Task.fromJson(Map<dynamic, dynamic> json) {
    return Task(
      id: json['id'],
      taskname: json['taskname'],
      contant: json['contant'],
      category: json['category'],
      done: json['done'],
    );
  }



}
