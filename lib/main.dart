import 'package:flutter/material.dart';
import 'package:flutter_lab1/utilits/global_vars.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter_lab1/post.dart';
import 'package:flutter_lab1/story.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => CountLikes(),
    child: MyApp(),
  )
      // const MyApp()
      );
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

double set_w(int w) => GlobalVars.screenWidth * w / 100;
double set_h(int h) => GlobalVars.screenHeight * h / 100;

List get_stories(Function s_s) {
  List stories = [];
  for (var i = 0; i < 20; i++) {
    stories.add(SizedBox(
      width: set_w(2),
    ));
    stories.add(Story());
    stories.add(SizedBox(
      width: set_w(2),
    ));
  }
  return stories;
}

List get_posts(BuildContext context) {
  List posts = [];
  for (var i = 0; i < 5; i++) {
    posts.add(Post(i));
    posts.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: set_w(2),
          ),
          Text(
            '${Provider.of<CountLikes>(context).likes[i][0]} likes',
            style: TextStyle(fontSize: set_h(3), fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
    posts.add(SizedBox(
      height: set_h(5),
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
      body: GlobalVars.is_hero
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
                  GlobalVars.is_hero = false;
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
                  ...get_posts(context),
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
