import 'dart:io';

int sumOfList({required List<int> numbers}) {
  int sum = 0;
  for (int number in numbers) {
    sum += number;
  }
  return sum;
}

void main() {
  stdout.write('Enter size of List : ');
  int n = int.parse(stdin.readLineSync() ?? '0');

  List<int> array = List.generate(n, (i) {
    stdout.write('Enter $i Element :');
    return int.parse(stdin.readLineSync() ?? '0');
  });

  int sum = sumOfList(numbers: array);

  print(sum);
}
