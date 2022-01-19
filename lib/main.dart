import 'package:flutter/material.dart';
import 'package:flutter_lab1/utilits/global_vars.dart';
import 'package:flutter/src/material/icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

bool is_hero = false;
double set_w(int w) => GlobalVars.screenWidth * w / 100;
double set_h(int h) => GlobalVars.screenHeight * h / 100;

List get_stories(Function s_s) {
  List stories = [];
  for (var i = 0; i < 20; i++) {
    stories.add(SizedBox(
      width: set_w(2),
    ));
    stories.add(Material(
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
              s_s(() {
                is_hero = true;
              });
            },
          ),
        ),
      ),
    ));
    stories.add(SizedBox(
      width: set_w(2),
    ));
  }
  return stories;
}

List get_posts() {
  List posts = [];
  for (var i = 0; i < 5; i++) {
    posts.add(Container(
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
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.icecream,
                        color: Colors.pink[100],
                        size: set_h(3),
                      )),
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
            height: set_h(4),
          ),
        ],
      ),
    ));
  }
  return posts;
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  List gradients = [
    [
      Colors.purple,
      Colors.white,
      Colors.lightBlue,
    ],
    [
      Colors.lightBlue,
      Colors.white,
      Colors.purple,
    ],
    [
      Colors.yellow[200],
      Colors.white,
      Colors.lightBlue,
    ],
    [
      Colors.lightGreen,
      Colors.white,
      Colors.purple,
    ],
    [
      Colors.pink,
      Colors.white,
      Colors.lightBlue,
    ]
  ];

  @override
  void didChangeDependencies() {
    initGame(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Instagram',
          style: TextStyle(color: Colors.black, fontSize: set_h(3)),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.send,
                color: Colors.black,
                size: set_h(3),
              ))
        ],
      ),
      body: is_hero
          ? Container(
              child: IconButton(
              icon: Hero(
                tag: 'story',
                child: Image(
                  image: AssetImage('assets/all.jpeg'),
                ),
              ),
              iconSize: set_w(95),
              onPressed: () {
                setState(() {
                  is_hero = false;
                });
              },
            ))
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [...gradients[currentIndex]])),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(
                    height: set_h(2),
                  ),
                  Container(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [...get_stories(setState)],
                    ),
                  )),
                  SizedBox(
                    height: set_h(2),
                  ),
                  ...get_posts(),
                ],
              )),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[600],
        iconSize: set_h(4),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.plus_one),
              label: 'Plus',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.icecream),
              label: 'Like',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Me',
              backgroundColor: Colors.blue),
        ],
      ),
    );
  }

  void initGame(BuildContext context) {
    GlobalVars.screenWidth = MediaQuery.of(context).size.width;
    GlobalVars.screenHeight = MediaQuery.of(context).size.height;
  }
}
