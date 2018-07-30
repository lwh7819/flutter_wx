import 'package:flutter/material.dart';
import 'BottomPicker.dart';
import 'RadioGroup.dart';
import 'CommonRow.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

const radioDisinfectionMethod = [
  {'label': '游离氯', 'value': 0},
  {'label': '总氯', 'value': 1},
  {'label': '臭氧    ', 'value': 2},
  {'label': '二氧化氯', 'value': 3},
];

const radioYesNo = [
  {'label': '是', 'value': 0},
  {'label': '否', 'value': 1},
];

const radioHaveNo = [
  {'label': '无', 'value': 0},
  {'label': '有', 'value': 1}
];

const radioQualifiedNo = [
  {'label': '不合格', 'value': 0},
  {'label': '合格', 'value': 1},
];

class MyAppa extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Colors.black,
      ),
      home: new Center(
        child: new BaseInfo(),
      ),
      localizationsDelegates: [                             //此处
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [                                   //此处
        const Locale('zh','CH'),
        const Locale('en','US'),
      ],
    );
  }
}

class BaseInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _BaseInfoState();
}

class _BaseInfoState extends State<BaseInfo> {
  String _value = '';
  int groupValue1 = -1;
  int groupValue2 = -1;
  bool enable = true;
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('title'),
        ),
        body: new Container(
          color: Colors.grey[100],
          child: new ListView(
            children: <Widget>[
              TextComponent('单位名称', '江干卫生监督所'),

              TextComponent('专业类别', '事业单位'),

              EditComponent('注册地址', '默认值1', enable),

              EditComponent('地址', '默认值2', enable),

              PickerComponent(context, '企业类型', _value, enable, (str) {
                setState(() {
                  if (str != null) _value = str;
                  print('lwh$_value');
                });
              }),

              RadioComponent('是否是大型企业', radioYesNo, groupValue1,
                  RadioLayoutType.SingleLine, enable, (e) {
                    setState(() {
                      groupValue1 = e;
                    });
                  }),
              groupValue1 == 1 ? EditComponent('大型企业类型', '默认值3', enable) : new SizedBox(
                height: 0.0,),

              RadioComponent('消毒方式', radioDisinfectionMethod, groupValue2,
                  RadioLayoutType.DoubleLine, enable, (e) {
                    setState(() {
                      groupValue2 = e;
                    });
                  }),

              DateTimePickerComponent(context, '出生日期', dateTime, enable, (DateTime date, TimeOfDay time) {
                setState(() {
                  print('lwh$time');
                  if (date != null) dateTime = date;
                });
              }),
            ],
          ),
        )
    );
  }
}

