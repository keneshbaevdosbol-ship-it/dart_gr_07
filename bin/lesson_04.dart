// Hi sensei!

void main() {
  // DRY - don't repeat yourself
  print('ЗАВТРАК');
  makeTea();

  print('ОБЕД');
  makeTea();

  print('УЖИН');
  makeTea();

  addition(7, 3, 'Сумма');
  addition(10, 5, 'Результат сложения');

  calculatePerimeter('Аудитория 2', 4.5, 7.0);
  calculatePerimeter('Кухня', 3.5, 4.0);
  calculatePerimeter('Холл', 10, 8);

  int areaOfAuditory2 = calculateArea(4.5, 7.0);
  int areaOfKitchen = calculateArea(3.5, 4.0);
  int areaOfHall = calculateArea(10, 8);

  print('Площадь комнаты Аудитория 2: $areaOfAuditory2 кв. м.');
  print('Площадь комнаты Кухня: $areaOfKitchen кв. м.');
  print('Площадь комнаты Холл: $areaOfHall кв. м.');
  print(
    'ОБЩАЯ ПЛОЩАДЬ: ${areaOfAuditory2 + areaOfKitchen + areaOfHall} кв. м.',
  );

  print(
    'Цена доставки по Бишкеку за 5 кг: ${shippingCost(baseCost: 100, weight: 5)}',
  );
  print(
    'Цена доставки до Ош за 2 кг: ${shippingCost(city: 'ОШ', baseCost: 400, weight: 2)}',
  );

  print(globalVariable);
}

double shippingCost({
  required double weight,
  required double baseCost,
  String city = 'Бишкек',
}) {
  double cost = baseCost * weight;
  if (city.toLowerCase() != 'бишкек') {
    cost *= 2;
  }
  return cost;
}

int calculateArea(double length, double width) {
  // возвращаемая функция с позиционными параметрами
  double area = length * width;
  return area.round();
}

void calculatePerimeter(String room, double length, double width) {
  // невозвращаемая функция с позиционными параметрами
  double perimeter = 2 * (length + width);
  print('Периметр комнаты $room: $perimeter м.');
}

void addition(int num_1, int num_2, String phrase) {
  // невозвращаемая функция с позиционными параметрами
  int result = num_1 + num_2;
  print('$phrase: $result');
}

void makeTea() {
  // невозвращаемая функция без параметров
  print('Вскипятить воду');
  print('Насыпать заварку');
  print('Залить кипятком');
  print('Дать настояться');
  print('Налить в чашку');
  print('Добавить молоко или сахар по-вкусу');
}

String globalVariable = 'Я глобальная переменная';
void scopeExample(int paramVariable) {
  print(globalVariable);
  print(paramVariable);
  // print(localVariable);
  String localVariable = 'Я локальная переменная';
  print(localVariable);
  if (paramVariable > 0) {
    print(localVariable);
    int ifBlockVariable = 1;
    print(ifBlockVariable);
  }
  // print(ifBlockVariable);
}
