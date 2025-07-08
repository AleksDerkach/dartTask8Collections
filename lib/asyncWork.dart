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
