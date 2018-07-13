import 'package:flutter/material.dart';

class MWalletVC extends StatefulWidget {
  MWalletVC({this.title});

  String title;

  @override
  _MWalletVCState createState() => new _MWalletVCState();
}

class _MWalletVCState extends State<MWalletVC> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title == null ? '': widget.title),
        brightness: Brightness.dark,
        backgroundColor: Colors.grey[800],
        elevation: 0.0,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 130.0,
            color: Colors.grey[800],
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Column(
                  //首付款
                  children: <Widget>[
                    new Icon(Icons.check_box, color: Colors.white,),
                    new Text(" "),
                    new Text("首付款", style: new TextStyle(color: Colors.white),),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                new Column(
                  //零钱
                  children: <Widget>[
                    new Icon(Icons.monetization_on, color: Colors.white),
                    new Text(" "),
                    new Text("零钱", style: new TextStyle(color: Colors.white),),
                    new Text(
                      "200.56", style: new TextStyle(color: Colors.white),),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                new Column(
                  //银行卡
                  children: <Widget>[
                    new Icon(Icons.credit_card, color: Colors.white),
                    new Text(" "),
                    new Text("银行卡", style: new TextStyle(color: Colors.white),),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
          ),
          new Container(
            height: 40.0,
            color: Colors.grey[100],
            padding: const EdgeInsets.only(left: 15.0, top: 10.0),
            child: new Text("腾讯服务"),
          ),
          new Container(
            height: 90.0,
            child: new Row(
              //信用卡还款,手机充值，理财通
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(Icons.credit_card),
                    new Text("信用卡还款"),
                  ],
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(Icons.phone_iphone),
                    new Text("手机充值"),
                  ],
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(Icons.fiber_smart_record),
                    new Text("理财通"),
                  ],
                )
              ],
            ),
          ),
          new Container(
            height: 90.0,
            child: new Row(
              //生活缴费，Q币，城市服务
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(Icons.edit_location),
                    new Text("生活缴费", textAlign: TextAlign.center,),
                  ],
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(Icons.spa),
                    new Text("Q币充值", textAlign: TextAlign.center,),
                  ],
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(Icons.location_city),
                    new Text("城市服务"),
                  ],
                )
              ],
            ),
          ),
          new Container(
            height: 90.0,
            child: new Row(
              //游戏微商店，腾讯公益，保险服务
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(Icons.local_pizza),
                    new Text("游戏微商店"),
                  ],
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(Icons.favorite),
                    new Text("腾讯公益"),
                  ],
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(Icons.beenhere),
                    new Text("保险服务"),
                  ],
                )
              ],
            ),
          ),
          new Container(
            height: 40.0,
            color: Colors.grey[100],
            padding: const EdgeInsets.only(left: 15.0, top: 10.0),
            child: new Text("限时推广"),
          ),
          new Container(
            height: 90.0,
            padding: const EdgeInsets.only(left: 40.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(Icons.sim_card),
                    new Text("腾讯王卡"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}