import 'package:flutter/cupertino.dart';
import 'package:showcaseview/showcaseview.dart';

class show_case extends StatelessWidget {
  show_case({super.key,
  required this.globalKey,
  required this.title,
  required this.description,
  required this.child,
  this.shapeBorder=const CircleBorder()

  
  });

  final GlobalKey globalKey;
  final String title;
  final String description;
  final Widget child;
  final ShapeBorder shapeBorder;

  @override
  Widget build(BuildContext context) {
    return Showcase(key: globalKey,title: title,description: description, child: child,targetShapeBorder: shapeBorder,);
  }
}
