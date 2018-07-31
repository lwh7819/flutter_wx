const radioDisinfectionMethod = [
  {'label': '游离氯', 'value': 0},
  {'label': '总氯', 'value': 1},
  {'label': '臭氧    ', 'value': 2},
  {'label': '二氧化氯', 'value': 3},
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
  'label4': 1,
  'label5': 0,
  'label6': 0,
  'label7': 0,
  'label8': 0,
  'label9': 0,
  'label10': 0,
};

getResult(List lists, value) {
  for(int i = 0; i < lists.length; i++) {
    if(lists[i]['value'] == value) {
      return lists[i]['label'];
    }
  }
  return '';
}