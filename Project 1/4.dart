import 'dart:io';

void main() {
  print('Matrix 1 : ');

  List<List<int>> matrix1 = List.generate(
      3,
      (i) => List.generate(3, (j) {
            stdout.write('Enter $i $j Element : ');
            return int.parse(stdin.readLineSync() ?? '0');
          }));

  print('Matrix 2 : ');

  List<List<int>> matrix2 = List.generate(
      3,
      (i) => List.generate(3, (j) {
            stdout.write('Enter $i $j Element : ');
            return int.parse(stdin.readLineSync() ?? '0');
          }));

  List<List<int>> Sum_Matrix =
      List.generate(3, (i) => List.generate(3, (j) => 0));

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      Sum_Matrix[i][j] = matrix1[i][j] + matrix2[i][j];
    }
  }

  print(matrix1);
  print(matrix2);
  print(Sum_Matrix);
}
