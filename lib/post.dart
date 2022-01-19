import 'package:flutter/material.dart';
import 'package:flutter_lab1/utilits/global_vars.dart';
import 'package:provider/provider.dart';

class Post extends StatefulWidget {
  final int number;
  Post(this.number, {Key? key}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  int likes = 0;
  double set_w(int w) => GlobalVars.screenWidth * w / 100;
  double set_h(int h) => GlobalVars.screenHeight * h / 100;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Material(
                elevation: 4.0,
                shape: CircleBorder(),
                clipBehavior: Clip.hardEdge,
                color: Colors.transparent,
                child: Ink.image(
                  image: AssetImage('assets/all.jpeg'),
                  fit: BoxFit.cover,
                  width: set_h(5),
                  height: set_h(5),
                  child: InkWell(
                    onTap: () {},
                  ),
                ),
              ),
              SizedBox(
                width: set_w(2),
              ),
              Text(
                "Cool_cat_777",
                style:
                    TextStyle(fontSize: set_h(3), fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: set_h(2),
          ),
          Image(
            image: AssetImage('assets/all.jpeg'),
            width: set_w(98),
            height: set_h(30),
          ),
          SizedBox(
            height: set_h(1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  LikeButton(widget.number, Provider),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.comment,
                        color: Colors.black,
                        size: set_h(3),
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.send,
                        color: Colors.black,
                        size: set_h(3),
                      ))
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark,
                    color: Colors.black,
                    size: set_h(3),
                  ))
            ],
          ),
          SizedBox(
            height: set_h(2),
          ),
          // Text('${Provider.} '),
        ],
      ),
    );
  }
}

class LikeButton extends StatelessWidget {
  // const LikeButton({Key? key}) : super(key: key);
  // int likeCount = 0;
  int num;

  LikeButton(this.num, Provider);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Provider.of<CountLikes>(context, listen: false).updateLikes(num);
        },
        icon: Icon(
          Icons.icecream,
          color: Provider.of<CountLikes>(context).likes[num][1]
              ? Colors.pink[100]
              : Colors.black,
          size: 35,
        ));
  }
}

class CountLikes extends ChangeNotifier {
  List likes = [
    [10, false],
    [15, false],
    [123, false],
    [4, false],
    [78, false]
  ];

  void updateLikes(int num) {
    likes[num][1] ? likes[num][0]-- : likes[num][0]++;
    notifyListeners();
    if (likes[num][1]) {
      likes[num][1] = false;
    } else {
      likes[num][1] = true;
    }
  }
}
