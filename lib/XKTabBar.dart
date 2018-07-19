import 'package:flutter/material.dart';
import 'package:flutter_wechat/services/model.dart';

class XkTabBar extends StatelessWidget {
  var ctx;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add, color: Colors.white,),
              onPressed: () {httpClient(ctx, (value){});}),
        ],
      ),
      body: new Builder(
          builder: (BuildContext context) {
            ctx = context;
            return new Container(
                alignment: Alignment.bottomCenter,
                child: new Text('')
            );
          }
      ),
    );
  }
}