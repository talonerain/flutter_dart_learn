import 'package:flutter/material.dart';
import 'package:flutter_dart_learn/Function_learn.dart';
import 'package:flutter_dart_learn/data_type.dart';
import 'package:flutter_dart_learn/generic_learn.dart';
import 'package:flutter_dart_learn/oop_learn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter必备Dart基础',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'F Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //_oopLearn();
    //_functionLearn();
    _genericLearn();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView(
        children: <Widget>[DateType()],
      )),
    );
  }

  void _oopLearn() {
    print('----_oopLearn()----');
    Logger log1 = Logger();
    Logger log2 = Logger();
    print(log1 == log2);

    Student.doPrint('_oopLearn');
    //创建Student对象
    Student stu1 = Student('清华', 'Jack', 18);
    stu1.school = '985';
    print(stu1.toString());

    Student stu2 = Student('北大', 'Tom', 16, city: '上海', country: '中国');
    print(stu2.toString());

    StudyFlutter studyFlutter = StudyFlutter();
    studyFlutter.study();
  }

  void _functionLearn() {
    print('----_functionLearn()----');
    TestFunction testFunction = TestFunction();
    testFunction.start();
  }

  void _genericLearn() {
    TestGeneric testGeneric = TestGeneric();
    testGeneric.start();
  }
}
