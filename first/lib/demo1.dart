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
            appBar: AppBar(title: Text('demo')),
            body: new Center(
              child:Container(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  children: [
                    Container(
                      height:200.0, 
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                      color:Colors.red,                      
                        child: Row(children: <Widget>[
                          Expanded(
                            child:Image.network('https://images.unsplash.com/photo-1593874859946-89d5cf517518?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',fit: BoxFit.cover,)
                          )
                        ],)),
                    new Row(
                      children: [
                        new Expanded(
                          child: new Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              new Container(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: new Text(
                                  'Oeschinen Lake Campground',
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              new Container(
                                child: new Text(
                                  'Kandersteg, Switzerland',
                                  style: new TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        new Icon(
                          Icons.star,
                          color: Colors.red[500],
                        ),
                        new Text('41'),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15.0,20.0,15.0,20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.call,
                                  color: Colors.blue,
                                  size: 40.0,
                                ),
                                Text('CALL',style:TextStyle(color:Colors.blue),)
                              ],
                            )),
                            Expanded(
                                child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.add_location,
                                  color: Colors.blue,
                                  size: 40.0,
                                ),
                                Text('ROUTE',style:TextStyle(color:Colors.blue))
                              ],
                            )),
                            Expanded(
                                child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.share,
                                  color: Colors.blue,
                                  size: 40.0,
                                ),
                                Text('SHARE',style:TextStyle(color:Colors.blue))
                              ],
                            )),
                          ]),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child:Text(
                            'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
                            textAlign: TextAlign.justify,
                            )
                        )
                      ],
                    )
                  ],
                )))) );
  }
}
