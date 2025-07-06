import 'dart:math';

void main() {
   taskList(); 
}

taskList(){
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

    int sum=0;
    for (int i=0; i<numbers.length-1; i++) {
      if(numbers[i]%3 == 0) {
        sum += numbers[i]; 
      } 
    }
    print('$sum - сума всіх елементів, що діляться на 3 без залишку');
    
    final temp = <int>[];
    for (var digit in numbers) {
        if(digit%2 == 0) {
        temp.add(digit); 
      }
    }
    print(temp);
    print('${temp.length} - довжина списку temp');
}