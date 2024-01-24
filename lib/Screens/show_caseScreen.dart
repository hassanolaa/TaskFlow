import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:todo_list/Screens/SplashScreen.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/model/Task.dart';
import 'package:todo_list/theme/AppColors.dart';

import '../model/DBhelper.dart';
import '../model/Models.dart';
import '../model/show_case.dart';


class show_caseScreen extends StatefulWidget {
  const show_caseScreen({super.key});

  @override
  State<show_caseScreen> createState() => _show_caseScreenState();
}

class _show_caseScreenState extends State<show_caseScreen> {
  DBhelper _dbHelper = DBhelper();
  List<Task>? _tasks;

  void updateListview() async {
    _tasks = await _dbHelper.getAllTasks();
    setState(() {});
  }

  deleteTask(Task task) async {
    await _dbHelper.DeleteTask(task);
  }

 final GlobalKey globalKeyOne = GlobalKey();
  final GlobalKey globalKeyTwo = GlobalKey();
  final GlobalKey globalKeyThree = GlobalKey();
  final GlobalKey globalKeyFour = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ShowCaseWidget.of(context).startShowCase(
            [globalKeyOne, globalKeyTwo, globalKeyThree, globalKeyFour]));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
   
    if (_tasks == null) {
      _tasks = [];
      updateListview();
    }
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
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => AddTaskScreen(
                //               task: Task.getNewEmpty(),
                //             )));
              },
              icon: Icon(Icons.add_circle),
              color: AppColors.Accent,
              iconSize: 30.sp,
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.Primary,
      body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 45.h,
            ),
            //* AppBar
            
            show_case(
               globalKey:globalKeyOne,
              title: 'Local user Info',
              description: 'To make it more interactive we have added a user info section ',
      
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  CircleAvatar(
                    radius: 25.r,
                    // backgroundColor: AppColors.Accent,
                    backgroundImage: AssetImage('images/2.png'),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.Support1,
                          ),
                        ),
                        Text(
                          "User",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.Accent,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 150.w,
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.list,
                          color: AppColors.Accent,
                          size: 35.sp,
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            //* Today's Task
            show_case(
              globalKey:globalKeyThree,
                     title: 'progress bar',
                     description: 'This progress bar shows the progress of the tasks in interactive way',
      
              child: Container(
                height: 170.h,
                width: 350.w,
                decoration: BoxDecoration(
                  color: AppColors.Accent,
                  borderRadius: BorderRadius.circular(20.r),
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
                        Text(
                          'Today\'s Task',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.Primary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 45.w,
                        ),
                        show_case(
                           globalKey:globalKeyTwo,
                           title: 'finished tasks counter',
                           description: 'This counter shows the number of finished tasks out of the total number of tasks',
                  
                          child: Text(
                            '2 \/ 5',
                            style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.Primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return TaskProsses(index, 2, 5);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            //* Create a new container for the list of tasks containing a title and subtitle and categories icon and a list of list icon button to edit and delete the task
            SizedBox(
              height: 5.h,
            ),
            show_case(
               globalKey:globalKeyFour,
              title: 'Tasks list',
              description: 'This is the list of tasks that you have added to your list',
      
              child: Container(
                height: 350.h,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 5, top: 5, left: 15, right: 15),
                      child: testTaskModel(
                        "Task name",
                        "Task description",
                        2,
                        1,
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        )),
      
      
    );
  }
}



class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
      return  ShowCaseWidget(
            builder: Builder(
                builder: (context) => const show_caseScreen()),
                autoPlay: true,
                onComplete: (index,key){
                  if(index == 3){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(title: "")),
                  );
                  }
                  },
         
        );
  }
}

