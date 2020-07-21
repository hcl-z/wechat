import 'package:flutter/material.dart';
import 'data.dart';

class Msg extends StatefulWidget {
  Msg({Key key}) : super(key: key);

  @override
  _MsgState createState() => _MsgState();
}

class _MsgState extends State<Msg> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: Msgcontent.map((value) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(value['imgurl']),
            ),
            title: Text(value['username']),
            subtitle: Text(value['lastmsg']),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(value['time']),
                Container(
                    height: 20,
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(19.0))),
                    child: Text(
                      value['msgnum'],
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ))
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
