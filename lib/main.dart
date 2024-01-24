import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_list/Screens/AddTaskScreen.dart';
import 'package:todo_list/Screens/CreateUserScreen.dart';
import 'package:todo_list/Screens/OnBoarding.dart';
import 'package:todo_list/Screens/SplashScreen.dart';
import 'package:todo_list/Screens/show_caseScreen.dart';
import 'package:todo_list/Screens/simpleNoti.dart';
import 'package:todo_list/model/DBhelper.dart';
import 'package:todo_list/model/Models.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'package:todo_list/theme/AppColors.dart';

import 'model/NotificationApi.dart';
import 'model/Task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  tz.initializeTimeZones();
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelGroupKey: "basic_channel_group",
      channelKey: "basic_channel",
      channelName: "Basic Notification",
      channelDescription: "Basic notifications channel",
    )
  ], channelGroups: [
    NotificationChannelGroup(
      channelGroupKey: "basic_channel_group",
      channelGroupName: "Basic Group",
    )
  ]);
  bool isAllowedToSendNotification =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedToSendNotification) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
          navigatorObservers: [FlutterSmartDialog.observer],
          // here
          builder: FlutterSmartDialog.init(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: SplashScreen(),
       
          ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DBhelper _dbHelper = DBhelper();
  List<Task>? _tasks;

  void updateListview() async {
    _tasks = await _dbHelper.getAllTasks();
    setState(() {});
  }

  deleteTask(Task task) async {
    await _dbHelper.DeleteTask(task);
  }

  String namee = storage.getname().toString();
  String path = storage.getimage().toString();

  @override
  Widget build(BuildContext context) {
    if (_tasks == null) {
      _tasks = [];
      updateListview();
    }
    int num = _tasks!.length;
    int done = storage.done;

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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddTaskScreen(
                              task: Task.getNewEmpty(),
                            )));
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20.w,
              ),
              CircleAvatar(
                radius: 25.r,
                // backgroundColor: AppColors.Accent,
                backgroundImage: AssetImage('$path'),
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
                      "$namee",
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
                    onPressed: () {
                  NotificationService()
                  .showNotification(title: 'Don\'t Forget\!', body: 'You have an upcoming task, Stay on track and mark it done in TaskFlow to keep your day productive!');
                    },
                    icon: Icon(
                      Icons.list,
                      color: AppColors.Accent,
                      size: 35.sp,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 35.h,
          ),
          //* Today's Task
          Container(
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
                    Text(
                      '$done \/ $num',
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.Primary,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: num,
                    itemBuilder: (context, index) {
                      return TaskProsses(index, done, num);
                    },
                  ),
                )
              ],
            ),
          ),
          //* Create a new container for the list of tasks containing a title and subtitle and categories icon and a list of list icon button to edit and delete the task
          SizedBox(
            height: 5.h,
          ),
          Container(
            height: 350.h,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _tasks!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      bottom: 5, top: 5, left: 15, right: 15),
                  child: TaskModel(
                      _tasks![index].taskname!,
                      _tasks![index].contant!,
                      _tasks![index].category!,
                      _tasks![index].done!,
                      _tasks![index]),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
