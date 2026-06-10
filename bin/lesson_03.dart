import 'dart:io';

void main() {
  print('Start of program');

  for (int i = 1; i <= 5; i = i + 1) {
    print('Step $i');
  }

  print('---------------------');
  int number = 7;
  for (int i = 1; i <= 10; i++) // i++ => i = i + 1 (increment)
  {
    print('$number x $i = ${number * i}');
  }

  print('---------------------');
  number = 5;
  for (int i = 10; i >= 1; i--) {
    // i-- => i = i - 1 (decrement)
    print('$number x $i = ${number * i}');
  }

  print('---------------------');
  number = 9;
  for (int i = 10; i >= 2; i = i - 2) {
    // i -= 2 => i = i - 2; i /= 4 => i = i / 4
    print('$number x $i = ${number * i}');
  }

  int count = 0;
  while (count <= 5) {
    print('Count = $count');
    count++;
    print('Squre of count = ${count * count}');
  }

  String myStr = 'Hello';
  print(myStr.length);

  myStr = '#';
  while (myStr.length < 5) {
    print(myStr);
    myStr = myStr + '#';
  }

  // List - список
  // упорядоченная коллекция элементов, доступ по индексу, может содержать дубликаты, изменяемый размер
  List<String> fruits = ['banana', 'apple', 'cherry'];
  print('I love ${fruits[2]} and ${fruits[0]}');
  print(fruits);
  fruits[1] = 'pear';
  print(fruits);
  // fruits[10] = 'kiwi';

  fruits.add('mango');
  print(fruits);
  fruits.insert(1, 'melon');
  print(fruits);
  fruits.add('banana');
  print(fruits);
  fruits.remove('banana');
  print(fruits);
  fruits.removeAt(1);
  print(fruits);
  fruits.removeLast();
  print(fruits);

  print('List count: ${fruits.length}');

  // Map - словарь
  // неупорядоченная коллекция пар ключ-значение, ключи уникальны
  Map<String, int> students = {'Alice': 19, 'Bob': 22, 'Kevin': 20};
  print('Bob is ${students['Bob']} years old.');
  students['Marry'] = 21;
  print(students);
  students['Alice'] = 18;
  print(students);
  students.remove('Bob');
  print(students);
  print('We have ${students.length} pairs in map.');

  students.forEach((k, v) {
    print('$k is $v y.o.');
  });

  // Set - множество
  // неупорядоченная коллекция уникальных элементов
  Set<String> colors = {'red', 'blue', 'white'};
  colors.add('yellow');
  print(colors);
  colors.add('red');
  print(colors);

  for (String c in colors) {
    print('My favorite color is $c');
  }

  print('------------------');
  List<int> numbers = [45, -2, 0, 78, -6, 11];
  for (int num in numbers) {
    if (num < 0) {
      break; // экстренно прерывает работу всего цикла
    }
    print(num);
  }

  print('------------------');
  for (int num in numbers) {
    if (num < 0) {
      continue; // прерывает работу текущего круга
    }
    print(num);
  }

  String value;
  while (true) {
    print('Enter a number or "q" to exit:');
    value = stdin.readLineSync()!;
    if (value == 'q') {
      break;
    }
    print('Entered number times 2: ${2 * int.parse(value)}');
  }

  for (int i = 1; i <= 3; i++) {
    print('Outer loop: $i');
    for (int j = 1; j <= 5; j++) {
      print('Inner loop: $j');
    }
  }
  print('End of program');
}
