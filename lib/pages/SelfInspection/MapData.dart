const radioDisinfectionMethod = [
  {'label': '游离氯', 'value': 0},
  {'label': '总氯', 'value': 1},
  {'label': '臭氧    ', 'value': 2},
  {'label': '二氧化氯', 'value': 3},
];

const compType = [
  {'label': '事业单位', 'value': 0},
  {'label': '个体', 'value': 1},
  {'label': '私营    ', 'value': 2},
  {'label': '国企', 'value': 3},
  {'label': '中外合资', 'value': 5},
];

const radioYesNo = [
  {'label': '否', 'value': 0},
  {'label': '是', 'value': 1},
];

const radioHaveNo = [
  {'label': '无', 'value': 0},
  {'label': '有', 'value': 1}
];

const radioQualifiedNo = [
  {'label': '不合格', 'value': 0},
  {'label': '合格', 'value': 1},
];

const initData = {
  'label0': true,
  'label1': '江干卫生监督所',
  'label2': '2018-02-06 15:32:21',
  'label3': 0,
  'label4': -1,
  'label5': -1,
  'label6': -1,
  'label7': -1,
  'label8': -1,
  'label9': -1,
  'label10': -1,
  'label11': -1,
  'label12': -1,
  'label13': 0,
  'label13_': '',
  'label14': -1,
  'label14_': '',
  'label15': -1,
  'label15_': '',
  'label16': -1,
  'label17': -1,
  'label17_': '',
  'label18': -1,
  'label18_': '',
  'label19': -1,
  'label19_': '',
  'label20': -1,
  'label20_': '',
  'label21': -1,
  'label21_': '',
  'label22': -1,
  'label23': -1,
  'label23_': '',
  'label24': -1,
  'label24_': '',
  'label25': -1,
  'label26': -1,
  'label27_': '',
};

getResult(List lists, value) {
  for(int i = 0; i < lists.length; i++) {
    if(lists[i]['value'] == value) {
      return lists[i]['label'];
    }
  }
  return '';
}