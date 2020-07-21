import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent)
  );
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title:Text(
            'MINE',
            style: TextStyle(
              color:Colors.black,
            ),
            ),
        
        
        ),
        body: Center(
          // child: Text(
          //   '洪传林 你好aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
          //   textDirection: TextDirection.ltr,
          //   textAlign: TextAlign.start,
          //   maxLines: 2,
          //   overflow: TextOverflow.ellipsis,
          //   style: TextStyle(
          //     fontSize: 35.0,
          //     color: Colors.purple,
          //     decoration: TextDecoration.underline,
          //     decorationStyle: TextDecorationStyle.solid
          //     ),
          // ),
          child: Container(
            // child: Text(
            //   'hello world',
            //   style: TextStyle(
            //     fontSize: 35.0,
            //     color:Colors.red,
            //   ),
            // ),
            // child: Image.network(
            //   'https://i0.hdslb.com/bfs/archive/9fa0e108d0b7764f6821c775e98afe44ee9d1856.jpg@880w_388h_1c_95q',
              //color:Colors.purple,
              // colorBlendMode: BlendMode.exclusion,
              // fit:BoxFit.contain,
              // repeat: ImageRepeat.repeat,
              // ),
              // child: ListView(
              //   scrollDirection: Axis.horizontal,
              //   children: <Widget>[
                  // ListTile(
                  //   leading: Icon(Icons.add_box),
                  //   title:Text('list below')
                  // ),
                  // ListTile(
                  //   leading: Icon(Icons.announcement),
                  //   title:Text('list first')
                  // ),
              //     Image.network('https://upload.jianshu.io/users/upload_avatars/2400087/ae7dc76c-b428-48f0-b159-9dffa59e7daa.jpeg?imageMogr2/auto-orient/strip|imageView2/1/w/100/h/100/format/webp'),
              //     Image.network('https://upload.jianshu.io/users/upload_avatars/2400087/ae7dc76c-b428-48f0-b159-9dffa59e7daa.jpeg?imageMogr2/auto-orient/strip|imageView2/1/w/100/h/100/format/webp'),
              //     Image.network('https://upload-images.jianshu.io/upload_images/2400087-57f04a6b5cba1efe.png?imageMogr2/auto-orient/strip|imageView2/2/w/430/format/webp'),
              //     Image.network('https://upload-images.jianshu.io/upload_images/2400087-57f04a6b5cba1efe.png?imageMogr2/auto-orient/strip|imageView2/2/w/430/format/webp'),
              //   ],
              // ),
            // alignment: Alignment.topLeft,
            width:300.0,
            height: 500.0,
            color:Colors.blue,
            // decoration: BoxDecoration(
            //   gradient: const LinearGradient(colors: [Colors.purple,Colors.pink]), 
            //   border: Border.all(width:5.0,color:Colors.blue),
            //   borderRadius:BorderRadius.all(Radius.circular(20.0))
            // ),
            // padding: const EdgeInsets.fromLTRB(20.0,10.0,0,0),
            // margin: const EdgeInsets.all(10.0)
            
          ),
        ),
      ),
    );
  }
}

