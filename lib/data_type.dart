import 'package:flutter/material.dart';

///常用数据类型
class DateType extends StatefulWidget {
  @override
  _DataTypeState createState() => _DataTypeState();
}

class _DataTypeState extends State<DateType> {
  @override
  Widget build(BuildContext context) {
    _numType();
    _stringType();
    _boolType();
    _listType();
    _mapType();
    _tips();

    return Container(
      child: Text('常用数据类型，请查看控制台输出'),
    );
  }

  ///数字类型
  void _numType() {
    num num1 = -1.0; //num是数字类型的父类，有两个子类，int和double
    num num2 = 2; //num是数字类型的父类，有两个子类
    int int1 = 3; //只能是整数
    double d1 = 1.68; //双精度
    print("num:$num1 num:$num2 int:$int1 double:$d1");
    print(num1.abs()); //求绝对值
    print(num1.toInt()); //转换成int
    print(num1.toDouble()); //转换成double
  }

  ///字符串
  void _stringType() {
    String str1 = '字符串', str2 = "双引号"; //字符串的定义
    String str3 = 'str1:$str1 str2:$str2'; //字符串拼接
    String str4 = 'str1:' + str1 + 'str2:' + str2; //字符串拼接
    print(str3);
    print(str4);
    String str5 = '常用数据类型，请查看控制台输出';
    // 字符串常用方法
    print(str5.substring(1, 5)); //字符串截取
    print(str5.indexOf("类型")); //获取指定字符串位置
  }

  ///布尔类型
  _boolType() {
    bool success = true;
    bool fail = false;
    print(success);
    print(fail);
    print(success || fail);
    print(success && fail);
  }

  ///list集合
  _listType() {
    print('----_listType----');

    ///集合初始化方式
    List list = [1, 2, 3, '集合']; //初始化时添加元素
    print(list);
    List<int> list2 = [];
    // list2 = list; //编译时不报错、运行时报错
    List list3 = [];
    list3.add('list3'); //通过add方法添加元素
    list3.addAll(list);
    List list4 = List.generate(3, (index) => index * 2); //根据index设置元素值
    print(list4);

    ///集合遍历的方式
    for (int i = 0; i < list.length; i++) {
      print(list[i]);
    }
    for (var o in list) {
      print(o);
    }
    list.forEach((element) {
      print(element);
    });
  }

  ///Map
  _mapType() {
    print('----_mapType----');
    Map names = {'xiaoming': '小明', 'xiaohong': '小红'};
    print(names);

    Map ages = {};
    ages['xiaoming'] = 16;
    ages['xiaohong'] = 18;
    print(ages);

    ///Map遍历
    ages.forEach((key, value) {
      print('$key,$value');
    });
    //将原来的map转换为一个新的map
    Map ages2 = ages.map((key, value) {
      return MapEntry(value, key);
    });
    print(ages2);
    //for循环遍历
    for (var key in ages.keys) {
      print('$key ${ages[key]}');
    }
  }

  ///科普小知识：dynamic、var、Object三者区别
  _tips() {
    print('----_tips----');

    ///dynamic 动态数据类型，运行时才知道类型，编译时可调用本身不存在的方法，运行时才报错，带来安全隐患，
    ///会使dart代码检查失效，不要直接使用
    dynamic x = 'hal';
    print(x.runtimeType);
    print(x);
    x = 123;
    print(x);
    x.foo;

    ///var 关键字，与dynamic区别是，var的类型一旦确定，不可被修改
    var a = 'var';
    print(a.runtimeType);
    print(a);

    ///Object dart对象的基类，与dynamic区别是，Object类型是确定的，编译时不可调用不存在的方法
    Object o1 = '111';
    print(o1.runtimeType);
    print(o1);
  }
}
