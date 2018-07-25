import 'package:flutter/material.dart';
import 'BaseView.dart';
import 'package:flutter_wechat/utils/CommonData.dart';
import 'package:flutter_wechat/model/PageComponentModel.dart';
import 'MyPageComponent.dart';
import 'package:flutter_wechat/utils/RouterUtil.dart';
import 'CardView.dart';

class MyPageView<T> extends BaseView {
  @override
  State<StatefulWidget> createBaseState() => new MyPageViewState();
}

class MyPageViewState extends BaseViewState {
  List<PageComponentModel> datas;
  @override
  void initState() {
    super.initState();
    datas = new List();
    datas.add(new PageComponentModel(CommonData.image1, "this is title 1"));
    datas.add(new PageComponentModel(CommonData.image2, "this is title 2"));
    datas.add(new PageComponentModel(CommonData.image3, "this is title 3"));
    datas.add(new PageComponentModel(CommonData.image4, "this is title 4"));
    datas.add(new PageComponentModel(CommonData.image5, "this is title 5"));
    datas.add(new PageComponentModel(CommonData.image6, "this is title 6"));

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return new Scaffold(
        body: new Column(
          children: <Widget>[
            new Expanded(
              flex: 2,
              child: new MyPageComponent(datas, callback: RouterUtil.NavigatorPush(context, new CardView())),
            ),
            new Expanded(
                flex: 5,
                child: new Text('')
            ),
          ],
        )
    );
  }

  @override
  Widget createStateWidget() {
    return null;
  }
}