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
