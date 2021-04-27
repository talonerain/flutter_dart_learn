class Student extends Person {
  // 通过下划线来标识私有字段
  String _school;
  String city;
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

  ///命名构造方法：类名+.+方法名
  ///使用命名构造方法为类实现多个构造方法
  Student.cover(Student stu) : super(stu.name, stu.age) {
    //构造方法方法体
    print('命名构造方法体也不是必需的');
  }
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
