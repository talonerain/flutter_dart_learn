class Student extends Person {
  // 通过下划线来标识私有字段
  String _school;
  final String city;
  String country;
  String name;

  ///构造方法
  ///通过this.school初始化自有参数
  ///name.age交给父类初始化
  ///city为可选参数
  ///country为默认参数
  Student(this._school, String name, int age,
      {this.city, this.country = 'china'})
      //初始化列表：除了调用父类构造方法，在子类构造方法体之前，也可以初始化变量，不同的变量直接通过,分隔
      : name = '$country.$city',
        //如果父类没有默认构造(无参构造方法)方法，则需要在初始列表中调用父类构造方法进行初始化
        super(name, age) {
    //构造方法方法体
    print('构造方法体不是必需的');
  }

  @override
  String toString() {
    return 'name:${this.name}, school:${this._school}, city:$city, country:$country ${super.toString()}';
  }

  //可以为私有字段设置getter来让外界获取私有字段
  String get school => _school;

  //可以为私有字段设置setter来控制外界对私有字段的修改
  set school(String value) {
    _school = value;
  }

  //静态方法
  static doPrint(String str) {
    print('doPrint:$str');
  }

  //命名构造方法：类名+.+方法名
  //使用命名构造方法为类实现多个构造方法
  Student.cover(Student stu, this.city) : super(stu.name, stu.age) {
    //构造方法方法体
    print('命名构造方法体也不是必需的');
  }

  //命名工厂构造方法：factory [类名+.+方法名]
  //它可以有返回值，而且不需要将类的final变量作为参数
  factory Student.stu(Student stu) {
    return Student(stu._school, stu.name, stu.age);
  }
}

///工厂构造方法
class Logger {
  static Logger _cache;

  ///工厂构造方法：
  ///不仅仅是构造方法，更是一种模式
  ///有时候为了返回一个之前已经创建好的缓存对象，原始的构造方法已经不能满足需求
  ///那么可以使用工厂模式来定义构造方法，内部通常使用命名构造方法来实现
  factory Logger() {
    if (_cache == null) {
      _cache = Logger._internal();
    }
    return _cache;
  }

  Logger._internal();
}

///与java一样，dart中所有对象都继承自Object
class Person {
  String name;
  int age;

  ///标准的构造方法
  Person(this.name, this.age);

  @override
  String toString() {
    return 'name:$name, age:$age';
  }
}

/// 继承抽象类要实现它的抽象方法，否则也需要将自己定义成抽象类
class StudyFlutter extends Study {
  @override
  void study() {
    print('Learning Flutter');
  }
}

///使用abstract修饰符来定义一个抽象类，该类不能被实例化，抽象类在定义接口的时候非常有用
///抽象类可以没有抽象方法，但是有抽象方法的类一定要被标识为抽象类
abstract class Study {
  void study();
}

///为类添加特征：mixins
///要是用mixins，在with关键字后面跟上一个或多个mixin的名字（用逗号分隔），并且with要在extends关键字之后
///mixins特征：实现mixin，要创建一个继承Object的子类，不声明任何构造方法，不调用super，与抽象不抽象无关
///上面的Study就是一个mixin
class Test extends Person with Study {
  Test(String name, int age) : super(name, age);

  @override
  void study() {}
}
