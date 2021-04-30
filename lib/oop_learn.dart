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
