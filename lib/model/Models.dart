import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_list/Screens/OnBoarding.dart';

import 'package:todo_list/main.dart';
import 'package:todo_list/model/DBhelper.dart';
import 'package:todo_list/model/Task.dart';

import '../Screens/CreateUserScreen.dart';
import '../theme/AppColors.dart';

class storage {
  static final box = GetStorage();
  static final bool = box.hasData('name');
  static int done = 0;

  static remove() {
    box.remove('name');
    box.remove('image');
  }

  static setname(String name) {
    box.write('name', name);
  }

  static getname() {
    return box.read('name');
  }

  static setimage(String path) {
    box.write('image', path);
  }

  static getimage() {
    return box.read('image');
  }
}

Widget Navi() {
  if (storage.bool == true) {
    return MyHomePage(title: "jdlkkcn");
  }
  return OnBoarding();
}

Widget TaskModel(
    String taskname, String contant, int cat, int done, Task task) {
  DBhelper _dbHelper = DBhelper();
  deleteTask(Task task) async {
    await _dbHelper.DeleteTask(task);
  }

  bool isSwitched = false;
  Color main = Colors.white;
  dynamic _singleValue = "Text alignment right";
  return StatefulBuilder(builder: (context, setState) {
    return GestureDetector(
      onTap: () {
        SmartDialog.show(builder: (context) {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.Primary,
              ),
              height: 300.h,
              width: 300.w,
              child: Column(children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Text("Details",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.Accent,
                        )),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      width: 60.w,
                      height: 3.h,
                      color: AppColors.Accent,
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                      child: Text("$contant",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.Support1,
                          )),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                  ],
                ),
              ]),
            ),
          );
        });
      },
      onLongPress: () {
        setState(() {
          isSwitched = !isSwitched;
        });
      },
      child: Container(
        height: 70.h,
        width: 320.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: main,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20.w,
                ),
                if (isSwitched == false) ...{
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        storage.done++;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contant) =>
                                    MyHomePage(title: "lc;ld")));
                        main = Colors.black;
                      });
                    },
                    child: CircleAvatar(
                      radius: 13.r,
                      backgroundColor: AppColors.Accent,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 10.r,
                        child: Center(
                            child: Icon(
                          Icons.done,
                          color: AppColors.Accent,
                          size: 15.sp,
                        )),
                      ),
                    ),
                  ),
                },
                if (isSwitched == true) ...{
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        deleteTask(task);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contant) =>
                                    MyHomePage(title: "lc;ld")));
                      });
                    },
                    child: Icon(
                      Icons.delete,
                      color: AppColors.Accent,
                      size: 28.sp,
                    ),
                  )
                },
                //    Slider(value: 0,  activeColor: AppColors.Accent,),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: Text(
                    '$taskname',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.Accent,
                    ),
                  ),
                ),
                SizedBox(
                  width: 50.w,
                ),
                if (cat == 1) ...{
                  Container(
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
                },
                if (cat == 2) ...{
                  Container(
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
                },
                if (cat == 3) ...{
                  Container(
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
                },
                if (cat == 4) ...{
                  Container(
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
                },

                SizedBox(
                  width: 10.w,
                ),
                // IconButton(
                //     onPressed: () {},
                //     icon: Icon(
                //       CupertinoIcons.list_bullet_indent,
                //       color: AppColors.Accent,
                //     ))
              ],
            ),
          ],
        ),
      ),
    );
  });
}

Widget TaskProsses(int index, int done, int all) {
  Color doneColor = Colors.black;
  int index1=index+1;
  if (index < done) {
    doneColor = Colors.white;
  }
  return Row(
    children: [
      if (index == 0) ...{
        SizedBox(
          width: 15.w,
        ),
      },
      CircleAvatar(
        child: CircleAvatar(
          radius: 20.r,
          child: Text(
            '$index1',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
                color: doneColor),
          ),
        ),
        radius: 25.r,
        backgroundColor: doneColor,
      ),
      if (index != all - 1) ...{
        Container(
          width: 20.w,
          height: 10.h,
          color: doneColor,
        )
      },
      if (index == all - 1) ...{
        SizedBox(
          width: 15.w,
        ),
      }
    ],
  );
}


Widget testTaskModel(
    String taskname, String contant, int cat, int done,) {
  DBhelper _dbHelper = DBhelper();
  deleteTask(Task task) async {
    await _dbHelper.DeleteTask(task);
  }

  bool isSwitched = false;
  Color main = Colors.white;
  dynamic _singleValue = "Text alignment right";
  return StatefulBuilder(builder: (context, setState) {
    return GestureDetector(
      onTap: () {
        SmartDialog.show(builder: (context) {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.Primary,
              ),
              height: 300.h,
              width: 300.w,
              child: Column(children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Text("Details",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.Accent,
                        )),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      width: 60.w,
                      height: 3.h,
                      color: AppColors.Accent,
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                      child: Text("$contant",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.Support1,
                          )),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                  ],
                ),
              ]),
            ),
          );
        });
      },
      onLongPress: () {
        setState(() {
          isSwitched = !isSwitched;
        });
      },
      child: Container(
        height: 70.h,
        width: 320.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: main,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20.w,
                ),
                if (isSwitched == false) ...{
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        storage.done++;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contant) =>
                                    MyHomePage(title: "lc;ld")));
                        main = Colors.black;
                      });
                    },
                    child: CircleAvatar(
                      radius: 13.r,
                      backgroundColor: AppColors.Accent,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 10.r,
                        child: Center(
                            child: Icon(
                          Icons.done,
                          color: AppColors.Accent,
                          size: 15.sp,
                        )),
                      ),
                    ),
                  ),
                },
                if (isSwitched == true) ...{
                  GestureDetector(
                    onTap: () {
                      setState(() {
                      
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contant) =>
                                    MyHomePage(title: "lc;ld")));
                      });
                    },
                    child: Icon(
                      Icons.delete,
                      color: AppColors.Accent,
                      size: 28.sp,
                    ),
                  )
                },
                //    Slider(value: 0,  activeColor: AppColors.Accent,),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: Text(
                    '$taskname',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.Accent,
                    ),
                  ),
                ),
                SizedBox(
                  width: 50.w,
                ),
                if (cat == 1) ...{
                  Container(
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
                },
                if (cat == 2) ...{
                  Container(
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
                },
                if (cat == 3) ...{
                  Container(
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
                },
                if (cat == 4) ...{
                  Container(
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
                },

                SizedBox(
                  width: 10.w,
                ),
                // IconButton(
                //     onPressed: () {},
                //     icon: Icon(
                //       CupertinoIcons.list_bullet_indent,
                //       color: AppColors.Accent,
                //     ))
              ],
            ),
          ],
        ),
      ),
    );
  });
}
