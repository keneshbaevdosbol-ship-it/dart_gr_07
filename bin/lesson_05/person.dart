class Person {
  String _name;
  int _age;

  // Person(this._name, this._age) {
  //   _wasBorn();
  // }

  Person({required String name, required int age}) : _name = name, _age = age {
    _wasBorn();
  }

  void _wasBorn() {
    print('Person $_name was born!');
  }

  // void setAge(int newAge) {
  //   if (newAge < 0) {
  //     print('Wrong value for age, it must be positive integer');
  //   } else {
  //     _age = newAge;
  //   }
  // }

  // сеттер для поля age
  set age(int value) {
    if (value < 0) {
      print('Wrong value for age, it must be positive integer');
    } else {
      _age = value;
    }
  }

  // int getAge(){return _age;}

  // геттер для поля age
  int get age => _age;

  String get name => _name;

  void displayInfo() {
    print('$_name $_age years old. Birth year: ${calculateBirthYear()}');
  }

  int calculateBirthYear() {
    return 2026 - _age;
  }
}
