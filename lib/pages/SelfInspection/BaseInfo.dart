import 'package:flutter/material.dart';
import 'RadioGroup.dart';
import 'CommonRow.dart';
import 'package:flutter_wechat/utils/DateUtils.dart';
import 'MapData.dart';

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
              TextComponent('单位名称', infoData['label1']),

              DateTimePickerComponent(context, '自查时间', infoData['label2'], enable, (String date) {
                setState(() {
                  if (date != null) infoData['label2'] = date;
                });
              }),

              RadioComponent('是否建立饮用水卫生管理制度', radioYesNo, infoData['label3'],
                  RadioLayoutType.SingleLine, enable, (e) {
                    setState(() {
                      infoData['label3'] = e;
                    });
                  }),

              RadioComponent('有无水质污染事件报告制度和突发事件应急处理预案', radioYesNo, infoData['label4'],
                  RadioLayoutType.SingleLine, enable, (e) {
                    setState(() {
                      infoData['label4'] = e;
                    });
                  }),

              RadioComponent('是否索取与生活饮用水接触的输、配水设备、水处理材料和防护材料等产品卫生许可批件、产品检验合格证明等相关资料', radioYesNo, infoData['label5'],
                  RadioLayoutType.SingleLine, enable, (e) {
                    setState(() {
                      infoData['label5'] = e;
                    });
                  }),

              RadioComponent('有无二次供水设施未配备水质消毒装置', radioYesNo, infoData['label5'],
                  RadioLayoutType.SingleLine, enable, (e) {
                    setState(() {
                      infoData['label5'] = e;
                    });
                  }),

              RadioComponent('水箱或蓄水池有无安全防护，加锁加盖卫生防护', radioYesNo, infoData['label5'],
                  RadioLayoutType.SingleLine, enable, (e) {
                    setState(() {
                      infoData['label5'] = e;
                    });
                  }),

              EditComponent('注册地址', '默认值1', enable),

              EditComponent('地址', '默认值2', enable),

              PickerComponent(context, '企业类型', infoData['label3'], radioDisinfectionMethod, enable, (result) {
                setState(() {
                  if (result != null) {
                    infoData['label3'] = result;
                  }
                });
              }),

              RadioComponent('是否是大型企业', radioYesNo, infoData['label4'],
                  RadioLayoutType.SingleLine, enable, (e) {
                    setState(() {
                      infoData['label4'] = e;
                    });
                  }),
              infoData['label4'] == 1 ? EditComponent('大型企业类型', '默认值3', enable) : new SizedBox(
                height: 0.0,),

              RadioComponent('消毒方式', radioDisinfectionMethod, infoData['label5'],
                  RadioLayoutType.DoubleLine, enable, (e) {
                    setState(() {
                      infoData['label5'] = e;
                      print('$infoData');
                    });
                  }),

              DateTimePickerComponent(context, '出生日期', infoData['label2'], enable, (String date) {
                setState(() {
                  if (date != null) infoData['label2'] = date;
                });
              }),
            ],
          ),
        )
    );
  }
}

