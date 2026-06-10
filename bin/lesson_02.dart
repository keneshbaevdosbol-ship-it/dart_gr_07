// ignore_for_file: dead_code

import 'dart:io';

void main() {
  // Операторы сравнения

  int x = 10;
  int y = 15;
  print(x == y); // Равно
  print(x != y); // Не равно
  print(x > y); // Больше
  print(x < y); // Меньше
  print(x >= y); // Больше или равно
  print(x <= y); // Меньше или равно

  // Условные конструкции if, if-else, if - else-if - else

  var temperature = 25;
  var isRaining = false;

  if (temperature > 20) {
    // Условие истинно
    const parkName = 'Central Park';
    print('The temperature is $temperature°C. Let\'s go to $parkName!');
  }

  if (isRaining) {
    // Условие ложно
    print('It\'s raining. Don\'t forget your umbrella!');
  }

  if (temperature > 30) {
    // Условие ложно
    print('Go swimming!');
  } else {
    // Альтернативный блок кода
    print('Go to the Gym!');
  }

  if (temperature == 25) {
    // Условие истинно
    print('It\'s a perfect day for a walk!');
  } else {
    print('Better stay indoors!');
  }

  /* else {
    print('Do something else!');
  } */ // Ошибка: Нельзя использовать else без if

  if (temperature > 35) {
    print('The weather is hot!');
  } else if (temperature > 20) {
    // Условие истинно, выполняется этот блок, остальные игнорируются
    print('The weather is warm!');
  } else if (temperature > 10) {
    print('The weather is cool!');
  } else if (temperature > 0) {
    print('The weather is cold!');
  } else {
    print('The weather is freezing!');
  }

  // Булева алгебра (and, or, not)
  const isWeekend = false;
  isRaining = true;
  temperature = 12;

  if (isRaining && temperature < 15) {
    // Оператор AND - истина, если оба условия истинны
    print('Stay home and read a book.');
  }

  if (isWeekend && isRaining) {
    // Оператор AND - ложь, так как isWeekend = false
    print('It\'s weekend and it\'s raining. Perfect time for a movie!');
  }

  if (isWeekend || isRaining) {
    // Оператор OR - истина, если хотя бы одно условие истинно
    print('Either it\'s weekend or it\'s raining. Time to relax!');
  }

  if (temperature > 20 || isWeekend) {
    // Оператор OR - ложь, так как оба условия ложны
    print('Let\'s go for a picnic!');
  }

  if (temperature > 15 && temperature < 25 ||
      isWeekend ||
      isRaining && temperature < 10) {
    // false && true || false || true && false -> 0 * 1 + 0 + 1 * 0 -> 0 + 0 + 0 -> 0 (false)
    print('Great day for outdoor activities!');
  }

  /* if (isWeekend) {
  } else {
    print('Time to work!');
  } */

  if (!isWeekend) {
    // Оператор NOT - инвертирует значение булева выражения
    print('Time to work!');
  }

  if (isWeekend) {
    // условие ложно - весь блок игнорируется
    print('Go to shopping!');
    // вложенная условная конструкция
    if (temperature < 10) {
      print('Buy warm clothes!');
    } else {
      print('Buy some snacks!');
    }
  }

  // Преобразование типов
  String ageString = "30";
  int ageInt = int.parse(ageString); // Преобразование строки в целое число
  print(ageInt + 5);

  double heightDouble = 1.85;
  String heightString = heightDouble
      .toString(); // Преобразование числа с плавающей точкой в строку
  print("Height: $heightString");

  /*String helloString = "Hello";
  int helloInt = int.parse(
    helloString,
  ); // Ошибка: Невозможно преобразовать строку в число
  */

  int number = 9;
  double numberDouble = number
      .toDouble(); // Преобразование целого числа в число с плавающей точкой
  double digit = 9.99;
  int digitint = digit
      .toInt(); // Преобразование числа с плавающей точкой в целое число
  print('$number, $numberDouble, $digit, $digitint');

  // Ввод информации из консоли (stdin)

  print('Enter Number 1:');
  final int num1 = int.parse(stdin.readLineSync()!);
  print('Enter Number 2:');
  final int num2 = int.parse(stdin.readLineSync()!);
  print('Enter a sign: +, -, *, or /:');
  // Запуск программы необходимо сделать из консоли, чтобы можно было ввести данные -> dart run bin/lesson_2.dart
  final String sign = stdin.readLineSync()!;

  // Режим отладки
  // Условная конструкция switch
  switch (sign) {
    case '+':
      print('Result: ${num1 + num2}');
      break;
    case '-':
      print('Result: ${num1 - num2}');
      break;
    case '*':
      print('Result: ${num1 * num2}');
      break;
    case '/':
      print('Result: ${num1 / num2}');
      break;
    default:
      print('Invalid sign entered.');
  }
}
