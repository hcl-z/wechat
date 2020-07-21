import 'package:flutter/material.dart';
import 'tabs/firends.dart';
import 'tabs/msg.dart';
import 'tabs/zoom.dart';
import 'drawer.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent)
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLUTTER2',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List tabsPages = [Msg(), Firends(), Zoom()];
  List TopTitle = ['消息', '好友', '空间'];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              leading:Builder(
                builder: (context)=>
                new IconButton(
                icon: new Container(
                  padding: EdgeInsets.all(3.0),
                  child: new CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          "https://upload.jianshu.io/users/upload_avatars/5256969/66fb45a4-e8f8-431c-9f8a-8ec45ad8c4a4.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96/format/webp")),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              ) ,
              title: Text(this.TopTitle[this.currentIndex]),
              centerTitle: true,
              // bottom: TabBar(
              //   tabs: <Widget>[
              //     Tab(text:'bar',icon: Icon(Icons.access_alarms),iconMargin: EdgeInsets.all(0),),
              //     Tab(text:'bar',icon: Icon(Icons.access_alarms))
              //   ],
              // ),
              actions: <Widget>[
                new IconButton(
                    icon: new Icon(Icons.search),
                    tooltip: '搜索',
                    onPressed: () {}),
                new IconButton(
                    icon: new Icon(Icons.add_a_photo),
                    tooltip: '搜索',
                    onPressed: () {})
              ],
            ),
            drawer: DrawerLeft(),
            body: this.tabsPages[this.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: this.currentIndex,
              onTap: (value) => {
                setState(() => {this.currentIndex = value}),
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.message), title: Text('消息')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.perm_contact_calendar),
                    title: Text('联系人')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text('空间')),
              ],
            )));
  }
}
