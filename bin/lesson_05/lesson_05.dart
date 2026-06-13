import 'car.dart';
import 'person.dart';

void main() {
  int number = 2;
  Car myCar = Car('red', 'BMW X6', 2020);
  print(number);
  print(myCar);
  myCar.displayInfo();
  // myCar.color = 'green';
  myCar.repaint('green');
  myCar.displayInfo();
  myCar.drive('Osh');

  Car friendsCar = Car('yellow', 'Toyota Camry', 2019);
  friendsCar.displayInfo();
  friendsCar.drive('Kant');

  Car bestCar = Car.redHonda(2009);

  Person friend = Person(name: 'Jim', age: 20);
  friend.age = 21;
  friend.displayInfo();
  // friend.name = 'Jimmy';
  print(friend.name);

  friendsCar.owner = friend;
  friendsCar.displayInfo();

  Car anotherCar = Car.withOwner('white', 'Mercedes 220', 2000, friend);
  // Person me =  Person(name: 'Jane', age: 50);
  //          a = b
  myCar.owner = Person(name: 'Jane', age: 50);

  myCar.displayInfo();

  print('End of Program');
}
