import 'dart:math';
import 'package:flutter_collections/asyncWork.dart';

void main() {
  //taskList();
  //taskSet();
  //taskMap();

  fetchNameDelayedTwoSeconds();
  fetchAgeDelayedMilliseconds();
  sequentiallyFetch();
  parallelFetch();
  delayedCountdown();
}

taskList() {
  final numbers = <int>[];
  while (numbers.length < 100) {
    numbers.add(Random().nextInt(101));
  }
  print(numbers);
  print(numbers[64]);
  numbers[49] = 1000000000;
  numbers.removeAt(23);
  numbers.removeAt(44);
  numbers.removeAt(65);
  numbers.removeAt(87);

  int sum = 0;
  for (int i = 0; i < numbers.length - 1; i++) {
    if (numbers[i] % 3 == 0) {
      sum += numbers[i];
    }
  }
  print('$sum - сума всіх елементів, що діляться на 3 без залишку');

  final temp = <int>[];
  for (var digit in numbers) {
    if (digit % 2 == 0) {
      temp.add(digit);
    }
  }
  print(temp);
  print('${temp.length} - довжина списку temp');
}

taskSet() {
  final uaNamesGPT = {
    'Анастасія',
    'Олександра',
    'Соломія',
    'Катерина',
    'Марія',
    'Дарина',
    'Вікторія',
    'Єва',
    'Злата',
    'Софія',
    'Ярина',
    'Олена',
    'Людмила',
    'Валерія',
    'Надія',
    'Оксана',
    'Тетяна',
    'Ніна',
    'Ірина',
    'Богдана',
    'Христина',
    'Лілія',
    'Марина',
    'Алла',
    'Уляна',
    'Тарас',
    'Богдан',
    'Олександр',
    'Артем',
    'Дмитро',
    'Андрій',
    'Іван',
    'Назар',
    'Юрій',
    'Владислав',
    'Максим',
    'Ігор',
    'Роман',
    'Сергій',
    'Михайло',
    'Володимир',
    'Степан',
    'Тимофій',
    'Захар',
    'Єгор',
    'Павло',
    'Ярослав',
    'Денис',
    'Лука',
    'Матвій'
  };

  final uaNamesDeepSeek = {
    'Андрій',
    'Марія',
    'Олександр',
    'Ольга',
    'Іван',
    'Наталія',
    'Михайло',
    'Тетяна',
    'Василь',
    'Катерина',
    'Петро',
    'Юлія',
    'Дмитро',
    'Анастасія',
    'Сергій',
    'Ірина',
    'Богдан',
    'Вікторія',
    'Володимир',
    'Оксана',
    'Ігор',
    'Анна',
    'Ярослав',
    'Людмила',
    'Віталій',
    'Світлана',
    'Роман',
    'Ганна',
    'Олег',
    'Надія',
    'Анатолій',
    'Валентина',
    'Артем',
    'Лариса',
    'Костянтин',
    'Аліна',
    'Максим',
    'Інна',
    'Станіслав',
    'Софія',
    'Владислав',
    'Віра',
    'Євген',
    'Марина',
    'Тарас',
    'Дарина',
    'Павло',
    'Зоряна',
    'Микола',
    'Ярина'
  };

  final unionNames = uaNamesGPT.intersection(uaNamesDeepSeek);

  print(unionNames);
  print('');

  final uniqueNamesGPT = uaNamesGPT.difference(uaNamesDeepSeek);
  print(uniqueNamesGPT);
  print('');

  final uniqueNamesDeepSeek = uaNamesDeepSeek.difference(uaNamesGPT);
  print(uniqueNamesDeepSeek);
}

taskMap() {
  List<String> randomWords = [
    'Андрій',
    'Марія',
    'Олександр',
    'Ольга',
    'Іван',
    'Наталія',
    'Михайло',
    'Тетяна',
    'Василь',
    'Катерина',
    'Петро',
    'Юлія',
    'Дмитро',
    'Анастасія',
    'Сергій',
    'Ірина',
    'Богдан',
    'Вікторія',
    'Володимир',
    'Оксана',
    'Ігор',
    'Анна',
    'Ярослав',
    'Людмила',
    'Віталій',
    'Світлана',
    'Роман',
    'Ганна',
    'Олег',
    'Надія',
    'Анатолій',
    'Валентина',
    'Артем',
    'Лариса',
    'Костянтин',
    'Аліна',
    'Максим',
    'Інна',
    'Станіслав',
    'Софія',
    'Владислав',
    'Віра',
    'Євген',
    'Марина',
    'Тарас',
    'Дарина',
    'Павло',
    'Зоряна',
    'Микола'
        'Ярина'
  ];

  Map<String, int> lengthWordMap = {
    for (var word in randomWords) word: word.length
  };

  print('Словник слів з їх довжиною:');
  lengthWordMap.forEach((word, length) {
    print('$word: $length');
  });

  print('\nВесь словник:');
  print(lengthWordMap);

  // Chat GPT зробив заповнення Map наступним чином
  // Досить цікаво

  // Створюємо tempNouns тільки з парними довжинами слів
  /* Map<String, int> tempNouns = {
    for (var entry in lengthWordMap.entries)
      if (entry.value % 2 == 0) entry.key: entry.value
  }; */

  Map<String, int> tempNouns = {};
  for (var entry in lengthWordMap.entries) {
    if (entry.value % 2 == 0) {
      tempNouns.addAll({entry.key: entry.value});
    }

    print('\nФільтрований словник (tempNouns) з парною довжиною слів:');
    print(tempNouns);
  }
}
