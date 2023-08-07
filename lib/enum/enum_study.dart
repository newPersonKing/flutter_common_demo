


enum PayType {
  wx (name: "wx",grade: 100),
  zfb (name: "zxf",grade: 200);

  final String name;
  final int grade;
  const PayType({required this.name, required this.grade});
}

void forEnum(){
  for(var element in PayType.values){
    print('name==${element.name}');
    print("index==${element.index}");
  }
}

extension PayTypeExt on PayType {
  // static 方法 能被 PayTypeExt 调用
  static PayType getWithIndex(int index){
    return PayType.values[index];
  }

  static PayType getWithName(String name){
    for(var element in PayType.values){
      if(element.name == name) return element;
    }
    throw Exception("NO Value name is $name");
  }
}

extension EnumByName<T extends Enum> on Iterable<T> {
  // 通过字符串获取枚举
  T byName(String name) {
    for (var value in this) {
      if (value.name == name) return value;
    }
    throw ArgumentError.value(name, "name", "No enum value with that name");
  }

  Map<String, T> asNameMap() =>
      <String, T>{for (var value in this) value.name: value};
}


void main(){
  // forEnum();
  PayTypeExt.getWithIndex(0);
  PayTypeExt.getWithName("wx");

  PayType.values.byName("wx");
  PayType.values.asMap();

}

