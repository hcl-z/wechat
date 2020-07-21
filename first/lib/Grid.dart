import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLUTTER2',
      home: Scaffold(
        appBar: AppBar(
          title:Text('水平/垂直方向布局'),
          backgroundColor: Colors.yellow,
        ),
      //     body:GridView.count(
      //       padding: const EdgeInsets.all(20.0),
      //       crossAxisSpacing: 10.0,
      //       mainAxisSpacing: 20.0,
      //       crossAxisCount: 2,
      //       children: <Widget>[
      //         // Text('lojds'),
      //         // Text('dsdsad'),
      //         // Text('dsdsad'),
      //         Image.network('https://csdnimg.cn/public/common/toolbar/images/csdnqr@2x.png'),
      //         Image.network('https://csdnimg.cn/public/common/toolbar/images/csdnqr@2x.png'),
      //         Image.network('https://csdnimg.cn/public/common/toolbar/images/csdnqr@2x.png'),
      //         Image.network('https://csdnimg.cn/public/common/toolbar/images/csdnqr@2x.png'),
      //         Image.network('https://csdnimg.cn/public/common/toolbar/images/csdnqr@2x.png'),
      //         Image.network('https://csdnimg.cn/public/common/toolbar/images/csdnqr@2x.png'),
      //         Image.network('https://csdnimg.cn/public/common/toolbar/images/csdnqr@2x.png'),
      //         Image.network('https://csdnimg.cn/public/common/toolbar/images/csdnqr@2x.png'),
      //         Image.network('https://csdnimg.cn/public/common/toolbar/images/csdnqr@2x.png'),
      //         Image.network('https://csdnimg.cn/public/common/toolbar/images/csdnqr@2x.png')
              
      //       ],
      //     )
      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: <Widget>[
      //     Expanded(
      //       child:RaisedButton(
      //       onPressed: (){},
      //       color: Colors.blue,
      //       textColor: Colors.red,
      //       child: Text('button'),
      //     ),
      //     ),
      //     Expanded(
      //       flex: 2,
      //       child:RaisedButton(
      //       onPressed: (){},
      //       color: Colors.blue,
      //       textColor: Colors.red,
      //       child: Text('button'),
      //     ),
      //     ),
      //     Expanded(
      //       child:RaisedButton(
      //       onPressed: (){},
      //       color: Colors.blue,
      //       textColor: Colors.red,
      //       child: Text('button'),
      //     ),
      //     ),
      //   ],
      // ),
      body:Center(
        child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('first'),
          //占满所有
          Expanded(child:Container(
            color:Colors.blue
          )),
          Text('Third'),
        ],
      )
      )
      ),
    );
  }
}
