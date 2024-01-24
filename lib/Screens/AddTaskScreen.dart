import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/model/DBhelper.dart';
import 'package:todo_list/theme/AppColors.dart';

import '../model/Task.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({this.task, super.key});
  Task? task;
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController _NametextEditingController = TextEditingController();
  TextEditingController _DetailstextEditingController = TextEditingController();
  int category = 0;

  DBhelper _dbHelper = DBhelper();

  void saveTask(Task task) async {
    if (task.id == 0) {
      await _dbHelper.InsertNewTask(task);
    }
  }

  @override
  void dispose() {
    _NametextEditingController.dispose();
    _DetailstextEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.white,
          ),
          width: 80.w,
          height: 50.h,
          child: Center(
            child: IconButton(
              onPressed: () {
                if (_NametextEditingController.text.trim() == null ||
                    _DetailstextEditingController == null ||
                    category == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Please fill all the fields"),
                  ));
                } else {
                  Task task = widget.task!;
                  task.taskname = _NametextEditingController.text.trim();
                  task.contant = _DetailstextEditingController.text.trim();
                  task.category = category;
                  task.done = 0;
                  print(task.taskname!+task.contant!+task.category.toString()+task.done.toString());
                  saveTask(task);
                  Navigator.push(context,MaterialPageRoute(builder: (context) => MyHomePage(title: "nkjsnck")));
                }

                // Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskScreen()));
              },
              icon: Icon(Icons.add_task),
              color: AppColors.Accent,
              iconSize: 30.sp,
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.Primary,
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                "   Create Task...",
                style: TextStyle(color: AppColors.Accent, fontSize: 30.sp),
              )),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 48,
              right: 48,
            ),
            child: TextField(
              controller: _NametextEditingController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.Accent, width: 2.w),
                      borderRadius: BorderRadius.circular(8.r)),
                  hintText: "Task name"),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 48,
              right: 48,
            ),
            child: TextField(
              controller: _DetailstextEditingController,
              maxLines: 8,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.Accent, width: 2.w),
                      borderRadius: BorderRadius.circular(8.r)),
                  hintText: "Task details"),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Category",
            style: TextStyle(color: AppColors.Accent, fontSize: 20.sp),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 80.w,
              ),
              GestureDetector(
                onTap: () {
                  category = 1;
                },
                child: Container(
                  height: 30.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: AppColors.Dominant,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      'Study',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.Primary,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              GestureDetector(
                onTap: () {
                  category = 2;
                },
                child: Container(
                  height: 30.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: AppColors.Support2,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      'Entertainment',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.Primary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 80.w,
              ),
              GestureDetector(
                onTap: () {
                  category = 3;
                },
                child: Container(
                  height: 30.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(246, 235, 21, 93),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      'Date \\ Meeting',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.Primary,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              GestureDetector(
                onTap: () {
                  category = 4;
                },
                child: Container(
                  height: 30.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(246, 21, 235, 157),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      'Work',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.Primary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
