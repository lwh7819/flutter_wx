import 'package:flutter/material.dart';
import 'Mine/MInfoVC.dart';
import 'Mine/MWalletVC.dart';
import 'utils/RouterUtil.dart';

class MineView extends StatefulWidget {
  @override
  _MineViewState createState() => new _MineViewState();
}

class _MineViewState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        backgroundColor: Colors.grey[200],
        body: new ListView(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: new Container(
                height: 80.0,
                child: new ListTile(
                  leading: new Image.asset("images/a001.jpg", height: 50.0,
                      width: 50.0,
                      fit: BoxFit.cover),
                  title: new Text("Lwh"),
                  subtitle: new Text("微信号：lwh"),
                  trailing: new Icon(Icons.fullscreen),
                  onTap: RouterUtil.NavigatorPush(context, new MInfoVC()),
                ),
                color: Colors.white,
              ),
              color: Colors.grey[200],
            ),
            new Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: new Container(
                child: new ListTile(
                  leading: new Icon(Icons.call_to_action),
                  title: new Text("钱包"),
                  trailing: new Icon(Icons.chevron_right, color: Colors.grey,),
                  onTap: RouterUtil.NavigatorPush(context, new MWalletVC(title: 'sss',)),
                ),
                color: Colors.white,
                height: 50.0,
              ),
              color: Colors.grey[200],
            ),
            new Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: new Container(
                child: new ListTile(
                  leading: new Icon(Icons.dashboard),
                  title: new Text("收藏"),
                  trailing: new Icon(Icons.chevron_right, color: Colors.grey,),
                ),
                color: Colors.white,
                height: 50.0,
              ),
              color: Colors.grey[200],
            ),
            new Container(
              child: new ListTile(
                leading: new Icon(Icons.photo),
                title: new Text("相册"),
                trailing: new Icon(Icons.chevron_right, color: Colors.grey,),
              ),
              color: Colors.white,
              height: 50.0,
            ),
            new Container(
              child: new ListTile(
                leading: new Icon(Icons.credit_card),
                title: new Text("卡包"),
                trailing: new Icon(Icons.chevron_right, color: Colors.grey,),
              ),
              color: Colors.white,
              height: 50.0,
            ),
            new Container(
              child: new ListTile(
                leading: new Icon(Icons.tag_faces),
                title: new Text("表情"),
                trailing: new Icon(Icons.chevron_right, color: Colors.grey,),
              ),
              color: Colors.white,
              height: 50.0,
            ),
            new Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: new Container(
                child: new ListTile(
                  leading: new Icon(Icons.settings),
                  title: new Text("设置"),
                  trailing: new Icon(Icons.chevron_right, color: Colors.grey,),
                ),
                color: Colors.white,
                height: 50.0,
              ),
              color: Colors.grey[200],
            ),
          ],
        )
    );
  }
}