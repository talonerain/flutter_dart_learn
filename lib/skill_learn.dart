///面向对象的编程技巧
///一：封装、继承、多态

void main() {
  List list;

  ///Dart编程技巧1：安全的调用
  ///对于不确定是否为空的对象可以通过?.foo()的方式来调用它的属性和方法防止npe
  print(list?.length);

  ///Dart编程技巧2：双问号设置默认值
  print(list?.length ?? -1);

  ///Dart编程技巧3：简化判断
  list = [];
  list.add(0);
  list.add('');
  list.add(null);
  if (list[0] == null || list[0] == '' || list[0] == 0) {
    print('list[0] is empty');
  }
  //与上面判断等效
  if ([null, '', 0].contains(list[0])) {
    print('list[0] is empty');
  }
}
