import 'dart:io';

void main() {
  stdout.write('Enter A List Size : ');
  int n = int.parse(stdin.readLineSync() ?? '0');

  List<int> array = List.generate(n, (i) {
    stdout.write('Enter $i Element :');
    return int.parse(stdin.readLineSync() ?? '0');
  });

  int max = array[0];

  array.forEach((elem) => {if (elem > max) max = elem});

  print('$max');
}
