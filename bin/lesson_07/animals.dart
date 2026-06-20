import 'interfaces.dart';
import 'mixins.dart';

// Можно наследовать.
// Может содержать готовые методы.
// Может иметь абстрактные методы, которые наследник обязан реализовать.
abstract class Animal implements Drawable {
  int age;
  String color;

  Animal(this.age, this.color);

  void sleep() {
    print('Animal is sleeping');
  }

  void makeSound();
}

class Cat extends Animal implements Playable {
  Cat(super.age, super.color);

  @override
  void makeSound() {
    print('Meow');
  }

  @override
  void draw() {
    print('🐈');
  }

  @override
  String draw3D(String material) {
    return 'Cat is drawn in 3D with $material';
  }

  @override
  void play() {
    print('Plays with laser');
  }
}

abstract class Reptile extends Animal {
  Reptile(super.age, super.color);
}

class Snake extends Reptile {
  Snake(super.age, super.color);

  @override
  void makeSound() {
    print('Ssssss');
  }
  
  @override
  void draw() {
    print('🐍');
  }
  
  @override
  String draw3D(String material) {
    return 'Snake is drawn in 3D with $material';
  }
}


class Parrot extends Animal with Fly implements Playable{
  Parrot(super.age, super.color);
  
  @override
  void draw() {
    print('🦜');
  }
  
  @override
  String draw3D(String material) {
    return 'Parrot is drawn in 3D with $material';
  }
  
  @override
  void makeSound() {
    print('Chirp');
  }
  
  @override
  void play() {
    print('Plays by mimicking sound');
  }
}