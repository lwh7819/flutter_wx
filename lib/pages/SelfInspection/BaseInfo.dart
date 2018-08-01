import 'package:flutter/material.dart';
import 'RadioGroup.dart';
import 'CommonRow.dart';
import 'package:flutter_wechat/utils/DateUtils.dart';
import 'MapData.dart';
import 'dart:async';

class BaseInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _BaseInfoState();
}

class _BaseInfoState extends State<BaseInfo> {
  bool enable;
  Map infoData = {};

  @override
  void initState() {
    super.initState();
    infoData = Map.of(initData);
    enable = infoData['label0'] ?? true;
  }

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
              TitleRow('基本信息'),
              TextComponent('单位名称', infoData['label1']),

              PickerComponent(
                  context, '企业类型', infoData['label3'], compType,
                  enable, (result) {
                setState(() {
                  if (result != null) {
                    infoData['label3'] = result;
                  }
                });
              }),

              DateTimePickerComponent(
                  context, '自查时间', infoData['label2'], enable, (String date) {
                setState(() {
                  if (date != null) infoData['label2'] = date;
                });
              }),

              TitleRow('检查内容'),
              RadioComponent(
                  '是否建立饮用水卫生管理制度',
                  radioYesNo,
                  infoData['label4'],
                  false,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label4'] = e;
                });
              }),

              RadioComponent(
                  '有无水质污染事件报告制度和突发事件应急处理预案',
                  radioHaveNo,
                  infoData['label5'],
                  false,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label5'] = e;
                });
              }),

              RadioComponent(
                  '是否索取与生活饮用水接触的输、配水设备、水处理材料和防护材料等产品卫生许可批件、产品检验合格证明等相关资料',
                  radioYesNo,
                  infoData['label6'],
                  false,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label6'] = e;
                });
              }),

              RadioComponent(
                  '有无二次供水设施未配备水质消毒装置',
                  radioHaveNo,
                  infoData['label7'],
                  false,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label7'] = e;
                });
              }),

              RadioComponent(
                  '水箱或蓄水池有无安全防护，加锁加盖卫生防护',
                  radioHaveNo,
                  infoData['label8'],
                  false,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label8'] = e;
                });
              }),

              RadioComponent(
                  '有无二次供水设施定期清洗消毒记录',
                  radioHaveNo,
                  infoData['label9'],
                  false,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label9'] = e;
                });
              }),

              RadioComponent(
                  '二次供水设施周围有无污染',
                  radioHaveNo,
                  infoData['label10'],
                  false,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label10'] = e;
                });
              }),

              RadioComponent(
                  '直接从事供、管水人员是否取得有效的健康合格证明和卫生知识培训合格证明',
                  radioYesNo,
                  infoData['label11'],
                  false,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label11'] = e;
                });
              }),

              RadioComponent(
                  '有无本年度水质检测报告书',
                  radioHaveNo,
                  infoData['label12'],
                  false,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label12'] = e;
                });
              }),

              TitleRow('快速检测'),
              RadioComponent(
                  '余氯是否合格',
                  radioYesNo,
                  infoData['label13'],
                  true,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label13'] = e;
                });
              }),
              infoData['label13'] == 0
                  ? EditComponent(
                  '余氯检测值', infoData['label13_'], enable, (String value) {
                      infoData['label13_'] = value;
              })
                  : Diver(),

              RadioComponent(
                  '浑浊度是否合格',
                  radioYesNo,
                  infoData['label14'],
                  true,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label14'] = e;
                });
              }),
              infoData['label14'] == 0
                  ? EditComponent('浑浊度检测值', infoData['label14_'], enable, (String value) {
                  infoData['label14_'] = value;
              })
                  : Diver(),

              RadioComponent(
                  'PH是否合格',
                  radioYesNo,
                  infoData['label15'],
                  true,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label15'] = e;
                });
              }),
              infoData['label15'] == 0
                  ? EditComponent('PH检测值', infoData['label15_'], enable, (String value) {
                  infoData['label15_'] = value;
              })
                  : Diver(),

              RadioComponent(
                  '快速检测综合判定',
                  radioQualifiedNo,
                  infoData['label16'],
                  true,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label16'] = e;
                });
              }),

              TitleRow('实验室检测'),
              RadioComponent(
                  '色度是否合格',
                  radioYesNo,
                  infoData['label17'],
                  true,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label17'] = e;
                });
              }),
              infoData['label17'] == 0
                  ? EditComponent('色度检测值', infoData['label17_'], enable, (String value) {
                  infoData['label17_'] = value;
              })
                  : Diver(),

              RadioComponent(
                  '浑浊度是否合格',
                  radioYesNo,
                  infoData['label18'],
                  true,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label18'] = e;
                });
              }),
              infoData['label18'] == 0
                  ? EditComponent('浑浊度检测值', infoData['label18_'], enable, (String value) {
                  infoData['label18_'] = value;
              })
                  : Diver(),

              RadioComponent(
                  '臭和味',
                  radioHaveNo,
                  infoData['label19'],
                  true,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label19'] = e;
                });
              }),
              infoData['label19'] == 1
                  ? EditComponent('臭和味检测值', infoData['label19_'], enable, (String value) {
                  infoData['label19_'] = value;
              })
                  : Diver(),

              RadioComponent(
                  '肉眼可见物',
                  radioHaveNo,
                  infoData['label20'],
                  true,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label20'] = e;
                });
              }),
              infoData['label20'] == 1 ? EditComponent(
                  '肉眼可见物检测值', infoData['label20_'], enable, (String value) {
                  infoData['label20_'] = value;
              }) : Diver(),

              RadioComponent(
                  'PH是否合格',
                  radioYesNo,
                  infoData['label21'],
                  true,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label21'] = e;
                });
              }),
              infoData['label21'] == 0
                  ? EditComponent('PH检测值', infoData['label21_'], enable, (String value) {
                  infoData['label21_'] = value;
              })
                  : Diver(),

              RadioComponent(
                  '消毒方式',
                  radioDisinfectionMethod,
                  infoData['label22'],
                  true,
                  RadioLayoutType.DoubleLine,
                  enable, (e) {
                setState(() {
                  infoData['label22'] = e;
                  print('$infoData');
                });
              }),

              RadioComponent(
                  '消毒剂余量是否合格',
                  radioYesNo,
                  infoData['label23'],
                  true,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label23'] = e;
                });
              }),
              infoData['label23'] == 0 ? EditComponent(
                  '消毒剂余量检测值', infoData['label23_'], enable, (String value) {
                  infoData['label23_'] = value;
              }) : Diver(),

              EditComponent('其他监测内容', infoData['label27_'], enable, (String value) {
                infoData['label27_'] = value;
              }),

             RadioComponent(
                  '其他监测内容是否合格',
                  radioYesNo,
                  infoData['label24'],
                  true,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label24'] = e;
                });
              }),

           infoData['label24'] == 0 ? EditComponent(
                  '其他监测内容检测值', infoData['label24_'], enable, (String value) {
                  infoData['label24_'] = value;
              }) : Diver(),

              RadioComponent(
                  '实验室检测综合判定',
                  radioQualifiedNo,
                  infoData['label25'],
                  true,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label25'] = e;
                });
              }),

              TitleRow('综合判定'),
              RadioComponent(
                  '综合判定',
                  radioQualifiedNo,
                  infoData['label26'],
                  true,
                  RadioLayoutType.SingleLine,
                  enable, (e) {
                setState(() {
                  infoData['label26'] = e;
                });
              }),

              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new MaterialButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  textColor: Colors.white,
                  onPressed: () {
                    print('commit$infoData');
                  },
                  child: new Text('保存'),
                ),)
            ],
          ),
        )
    );
  }
}

