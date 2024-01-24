import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/Screens/show_caseScreen.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/model/Models.dart';
import 'package:todo_list/theme/AppColors.dart';

class CreateUserAccScreen extends StatefulWidget {
  const CreateUserAccScreen({super.key});

  @override
  State<CreateUserAccScreen> createState() => _CreateUserAccScreenState();
}

class _CreateUserAccScreenState extends State<CreateUserAccScreen> {
  Color Cont1Color = Colors.white;
  Color Cont2Color = Colors.white;
  Color Cont3Color = Colors.white;
  Color Cont4Color = Colors.white;
  String image = 'null';
  String name = 'null';
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Primary,
      body: Column(
        children: [
          SizedBox(
            height: 70.h,
          ),
          Center(
            child: Text('Welcome to the Family!',
                style: TextStyle(
                  fontSize: 30.sp,
                  color: AppColors.Accent,
                  fontWeight: FontWeight.bold,
                )),
          ),
          SizedBox(
            height: 40.h,
          ),
          Center(
            child: Text('Select your Avatar',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.Accent,
                )),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 45.w,
              ),
              GestureDetector(
                onTap: () {
                  if (Cont1Color == AppColors.Dominant) {
                    setState(() {
                      Cont1Color = Colors.white;
                      image = 'null';
                      num = 0;
                    });
                  } else {
                    setState(() {
                      Cont1Color = AppColors.Dominant;
                      image = 'images/1.png';
                      num = 1;
                    });
                  }
                },
                child: Container(
                    width: 110.w,
                    height: 110.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(width: 2.sp, color: AppColors.Accent),
                      color: Cont1Color,
                    ),
                    child: CircleAvatar(
                      radius: 55.r,
                      backgroundImage: AssetImage('images/1.png'),
                    )),
              ),
              SizedBox(
                width: 40.w,
              ),
              GestureDetector(
                onTap: () {
                  if (Cont2Color == AppColors.Dominant) {
                    setState(() {
                      Cont2Color = Colors.white;
                      image = 'null';
                      num = 0;
                    });
                  } else {
                    setState(() {
                      Cont2Color = AppColors.Dominant;
                      image = 'images/2.png';
                      num = 2;
                    });
                  }
                },
                child: Container(
                    width: 110.w,
                    height: 110.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(width: 2.sp, color: AppColors.Accent),
                      color: Cont2Color,
                    ),
                    child: CircleAvatar(
                      radius: 55.r,
                      backgroundImage: AssetImage('images/2.png'),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 45.w,
              ),
              GestureDetector(
                onTap: () {
                  if (Cont3Color == AppColors.Dominant) {
                    setState(() {
                      Cont3Color = Colors.white;
                      image = 'null';
                      num = 0;
                    });
                  } else {
                    setState(() {
                      Cont3Color = AppColors.Dominant;
                      image = 'images/3.png';
                      num = 3;
                    });
                  }
                },
                child: Container(
                    width: 110.w,
                    height: 110.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(width: 2.sp, color: AppColors.Accent),
                      color: Cont3Color,
                    ),
                    child: CircleAvatar(
                      radius: 55.r,
                      backgroundImage: AssetImage('images/3.png'),
                    )),
              ),
              SizedBox(
                width: 40.w,
              ),
              GestureDetector(
                onTap: () {
                  if (Cont4Color == AppColors.Dominant) {
                    setState(() {
                      Cont4Color = Colors.white;
                      image = 'null';
                      num = 0;
                    });
                  } else {
                    setState(() {
                      Cont4Color = AppColors.Dominant;
                      image = 'images/4.png';
                      num = 4;
                    });
                  }
                },
                child: Container(
                    width: 110.w,
                    height: 110.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(width: 2.sp, color: AppColors.Accent),
                      color: Cont4Color,
                    ),
                    child: CircleAvatar(
                      radius: 55.r,
                      backgroundImage: AssetImage('images/4.png'),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 55.h,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 48,
              right: 48,
            ),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              // controller: _NametextEditingController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.Accent, width: 2.w),
                      borderRadius: BorderRadius.circular(8.r)),
                  hintText: "your name"),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 270.w,
              ),
              IconButton(
                onPressed: () async {
                  if (image != 'null' &&name != null && name != 'null' &&num != 0) {
                    storage.setname(name);
                      storage.setimage(image);
                    Navigator.push( context, MaterialPageRoute(builder: (context) => test()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Please fill all the fields',
                          style: TextStyle(
                            color: AppColors.Accent,
                          ),
                        ),
                      ),
                    );
                  }
                },
                icon: Icon(
                  Icons.arrow_circle_right,
                  size: 55.sp,
                  color: AppColors.Accent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
