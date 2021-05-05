class TestFunction {
  FunctionLearn functionLearn = FunctionLearn();

  void start() {
    functionLearn.sum(1, 2);
  }
}

class FunctionLearn {
  ///方法的构成
  ///返回值+方法名+参数
  ///返回值类型可缺省，可以是void也可以是具体的类型
  ///方法：匿名方法不需要方法名
  ///参数：参数类型和参数名，参数类型可缺省，参数又分为可选参数和默认参数，与构造方法中的参数一样
  int sum(int val1, int val2) {
    return val1 + val2;
  }

  ///私有方法
  ///通过_开头命名的方法，与私有变量一样
  ///作用域是当前文件
  _learn() {
    print('私有方法');
  }

  ///匿名方法
  ///匿名方法也被成为lambda
  ///后面大括号中的代码为函数体：
  ///([Type] param) {
  /// codeBlock;
  ///};
  anonymousFunction() {
    var list = ['私有方法', '匿名方法'];
    list.forEach((element) {
      print(list.indexOf(element).toString());
    });
  }
}
