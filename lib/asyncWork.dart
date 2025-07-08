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
