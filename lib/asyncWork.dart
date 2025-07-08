import 'dart:async';

void fetchNameDelayedTwoSeconds() async {
  String name = await fetchName();
  print('Мене звати $name');
}

Future<String> fetchName() async {
  // Імітація затримки в 2 секунди
  return await Future.delayed(Duration(seconds: 2), () {
    return 'Олександр'; // Твоє ім'я
  });
}

void fetchAgeDelayedMilliseconds() async {
  String ageDigit = await fetchAge();
  String yearWord = formatYearWord(ageDigit);
  print('Мені $ageDigit $yearWord');
}

String formatYearWord(String age) {
  int lastDigit = int.parse(age.substring(1));

  switch (lastDigit) {
    case 1:
      return "років";
    case >= 2 && <= 4:
      return "роки";
    default:
      return "років";
  }
}

Future<String> fetchAge() async {
  // Імітація затримки в 1500 секунди
  return await Future.delayed(Duration(milliseconds: 1500), () {
    return '30';
  });
}

void sequentiallyFetch() async {
  final stopwatch = Stopwatch();
  stopwatch.start();
  String name = await fetchName();
  String ageStr = await fetchAge();

  stopwatch.stop();

  int age = int.parse(ageStr);
  String yearWord = formatYearWord(ageStr);

  print('Мене звати $name');
  print('Мені $age $yearWord');
  print('Час виконання: ${stopwatch.elapsed.inMilliseconds} мс');
}

void parallelFetch() async {
  final stopwatch = Stopwatch()..start();

  final res = await Future.wait([fetchName(), fetchAge()]);

  final String name = res[0] as String;
  final String age = res[1] as String;

  stopwatch.stop();
  print('Моє ім\'я: $name');
  print('Мені: $age');
  print('Виконано за : ${stopwatch.elapsed.inSeconds} c.');
}

void delayedCountdown() async {
  final res = await Countdown(5);
  print(res);
}

Future<String> Countdown(int sec) async {
  for (var i = sec; i > 0; i--) {
    print('$i...');
    await Future.delayed(Duration(seconds: 1));
  }
  return 'Старт!';
}

streamFromIterable() async {
  final stream = Stream.fromIterable([1, 2, 3, 4, 5]);

  print('Вивести з await for:');
  await printStreamWithAwaitFor(stream);
}

// await for
Future<void> printStreamWithAwaitFor(Stream<int> stream) async {
  await for (final number in stream) {
    print(number);
    await Future.delayed(Duration(milliseconds: 500));
  }

  final streamForListen = Stream.fromIterable([1, 2, 3, 4, 5]);

  print('\nВивести з listen:');
  printStreamWithListen(streamForListen);
}

void printStreamWithListen(Stream<int> stream) {
  stream.listen(
    (number) {
      print(number);
    },
    onError: (error) => print('Помилка: $error'),
    onDone: () => print('Стрім listen завершено'),
  );
}

streamFromPeriodic() async {
  final stream = Stream.periodic(
      Duration(seconds: 1), // Інтервал між значеннями
      (count) => count + 1 // Генеруємо числа починаючи з 1
      ).take(10); // Обмежуємо до 10 значень

  await for (final number in stream) {
    print('$number.,');
  }
  print('Відлік завершено!');
}

streamWithController() async {
  // 1. Створюємо StreamController
  final streamController = StreamController<String>();

  // 2. Прослуховуємо стрім
  streamController.stream.listen(
    (value) {
      print('Отримано значення: $value');
    },
    onDone: () {
      print('Стрім завершено');
    },
    onError: (error) {
      print('Сталася помилка: $error');
    },
  );

  // 3. Додаємо значення вручну
  streamController.sink.add('Hello');
  streamController.sink.add('World');
  streamController.sink.add('Dart');

  // 4. Закриваємо контролер
  Future.delayed(Duration(milliseconds: 100), () {
    streamController.close();
  });
}
