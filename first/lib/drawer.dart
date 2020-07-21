import 'package:flutter/material.dart';

class DrawerLeft extends StatelessWidget {
  const DrawerLeft({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Column(children: <Widget>[
        
            DrawerHeader(
              decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1593432889392-09097dc1a1ad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),fit: BoxFit.cover),
                color: Colors.lightBlueAccent,
              ),
              child: Center(
                child: SizedBox(
                  width: 60.0,
                  height: 60.0,
                  child: CircleAvatar(
                    child: Text('R'),
                  ),
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置'),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(Icons.settings),
                    Text('设置')
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.settings),
                    Text('设置')
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.settings),
                    Text('设置')
                  ],
                )
              ],
            ),
            SizedBox(height: 10,)
      ])
    );
  }
}
