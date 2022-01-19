import 'package:flutter/material.dart';
import 'package:flutter_lab1/utilits/global_vars.dart';

class Story extends StatefulWidget {
  Story({Key? key}) : super(key: key);

  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  double set_w(int w) => GlobalVars.screenWidth * w / 100;
  double set_h(int h) => GlobalVars.screenHeight * h / 100;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      shape: CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: Hero(
        tag: 'story',
        child: Ink.image(
          image: AssetImage('assets/all.jpeg'),
          fit: BoxFit.cover,
          width: set_h(10),
          height: set_h(10),
          child: InkWell(
            onTap: () {
                GlobalVars.is_hero = true;
            },
          ),
        ),
      ),
    );
  }
}
