import 'person.dart';

class Car {
  // поля / атрибуты
  String color;
  String model;
  int year;
  Person? owner;

  // Конструктор
  // Car(String color, String model, int year) {
  //   this.color = color;
  //   this.model = model;
  //   this.year = year;
  // }

  // Конструктор с инициализирующим списком
  // Car(String color, String model, int year)
  //   : this.color = color,
  //     this.model = model,
  //     this.year = year;

  // Конструктор с параметрами, присваивающимися напрямую
  Car(this.color, this.model, this.year);

  // Именнованый конструктор, с инициализирующим списком
  Car.redHonda(this.year) : color = 'red', model = 'Honda Fit';
  Car.withOwner(this.color, this.model, this.year, this.owner);

  // методы
  void drive(String city) {
    print('Car $model is driving to $city.');
  }

  void repaint(String newColor) {
    color = newColor;
  }

  void displayInfo() {
    print('MODEL: $model COLOR: $color YEAR: $year');
    if (owner != null) {
      print('OWNER INFO:');
      owner!.displayInfo();
    }
  }
}
