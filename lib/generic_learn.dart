import 'package:flutter_dart_learn/oop_learn.dart';

class TestGeneric {
  void start() {
    Cache<String> cache1 = Cache();
    //泛型作用：类型检查约束，类比：List<String>
    //这里的value必须是String，否则编译会报错
    cache1.setItem('cache1', 'cache1');
    String string1 = cache1.getItem('cache1');
    print(string1);

    Cache<int> cache2 = Cache();
    cache2.setItem('cache2', 1008);
    int string2 = cache2.getItem('cache2');
    print(string2);

    Member<Student> member = Member(Student('', '', 16));
    print(member.fixedName());
  }
}

///泛型
///泛型主要是解决类、接口、方法的复用性，以及对不特定数据类型的支持
///提高代码的复用度
class Cache<T> {
  static final Map<String, Object> _cached = Map();

  void setItem(String key, T value) {
    _cached[key] = value;
  }

  T getItem(String key) {
    return _cached[key];
  }
}

///有时候在实现类似通用接口的泛型中，期望的类型是某些特定类型时，这时可以使用类型约束
class Member<T extends Person> {
  T _person;

  Member(this._person);

  String fixedName() {
    return 'fixed:${_person.name}';
  }
}
