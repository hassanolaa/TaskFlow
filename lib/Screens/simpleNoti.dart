import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/model/NotificationApi.dart';

import '../model/Awesome.dart';
// Replace with the actual package name

class simpleNoti extends StatefulWidget {
  const simpleNoti({super.key});

  @override
  State<simpleNoti> createState() => _simpleNotiState();
}

class _simpleNotiState extends State<simpleNoti> {
  @override
  @override
  void initState() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold( floatingActionButton: FloatingActionButton(
          onPressed: () {
            AwesomeNotifications().createNotification(
              content: NotificationContent(
                  id: 1,
                  channelKey: "basic_channel",
                  title: "Hello world!",
                  body: "Yay! I have local notifications working now!"),
            );
          },
          child: Icon(
            Icons.notification_add,
          ),
        ),
      body: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          TextButton(
            onPressed: () {
              //  NotificationApi.showNotification(
              //     title: 'title',
              //     body: 'body',
              //     payload: 'payload',
              //   );
              NotificationService()
                  .showNotification(title: 'Sample title', body: 'It works!');
            },
            child: const Text('simple notification'),
          ),
          SizedBox(
            height: 100.h,
          ),
          TextButton(
            onPressed: () {
              //  NotificationApi.showNotification(
              //     title: 'title',
              //     body: 'body',
              //     payload: 'payload',
              //   );
              NotificationService().showScheduledNotification();
            },
            child: const Text('simple notification'),
          ),
            SizedBox(
            height: 100.h,
          ),
          TextButton(
            onPressed: () {
              //  NotificationApi.showNotification(
              //     title: 'title',
              //     body: 'body',
              //     payload: 'payload',
              //   );
              NotificationService().showDailyScheduledNotification();
            },
            child: const Text('simple notification'),
          ),
        ],
      ),
    );
  }
}
