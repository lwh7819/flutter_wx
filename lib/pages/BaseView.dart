import 'package:flutter/material.dart';
import '../utils/DialogUtil.dart';
import '../view/BaseDialog.dart';

bool hasLoad = false;
bool isError = false;
String errorMsg;
Widget currentBody;

abstract class BaseView extends StatefulWidget{
  @protected
  State createBaseState();

  @override
  State<StatefulWidget> createState() {
    return createBaseState();
  }
}

abstract class BaseViewState extends State<BaseView>{
  @protected
  Widget buildWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return buildWidget(context);
  }

  /**
   * 创建需要加载数据的界面
   */
  @protected
  Widget createStateWidget();

  /**
   * 数据加载
   */
  @protected
  @mustCallSuper
  void loadData() {
    setState(() {
      isError = false;
      hasLoad = false;
    });
  }

  Widget getCurrentBody() {
    hasLoad == true ? currentBody = createStateWidget() : currentBody = createLoadingView();
    if(isError) currentBody = createErrorView(errorMsg, loadData);
    return currentBody;
  }

  Function onError() {
    return (error) {
      print("error:${error.toString()}");
      setState(() {
        isError = true;
        errorMsg = error.toString();
      });
    };
  }

}

Widget createLoadingView() {
  return new FullScreenDialog(
    isCenter: true,
    child: new CircularProgressIndicator(
      valueColor: new ValueColor(),
    ),
    canclable: false,
  );
}

Widget createErrorView(String errorMsg, Function relode) {
  return new Center(
      child: new Column(
        children: <Widget>[
          new Expanded(
            flex: 2,
            child: new Text(''),
          ),
          new Expanded(
            flex: 3,
              child: new Column(children: <Widget>[
            new Image.asset("assets/images/ic_error.png"),
            new Container(child: new Text(errorMsg,),),
            new InkWell(
              child: new Text(
                '点击重新加载', style: new TextStyle(color: Colors.blue),),
              onTap: relode,)
          ],)),
          new Expanded(child: new Text('')),
        ],)
  );
}