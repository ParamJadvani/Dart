import 'dart:io';

void main() {
  int choice;

  List<int> array = [];

  do {
    print('Enter 1 for Insert the element from last into List');
    print('Enter 2 for delete the element from last from List');
    print('Enter 3 for Update the element from List');
    print('Enter 4 for View the element from List');
    print('Enter 0 for Exit');
    choice = int.parse(stdin.readLineSync() ?? '0');

    switch (choice) {
      case 1:
        stdout.write('Enter Element :');
        int n = int.parse(stdin.readLineSync() ?? '0');
        array.add(n);
        break;
      case 2:
        if (array.length > 0) {
          stdout.write('Enter Element for Remove :');
          int n = int.parse(stdin.readLineSync() ?? '0');
          array.remove(n);
        } else {
          print('Please Enter Some Element into Array');
        }
        break;
      case 3:
        if (array.length > 0) {
          stdout.write('Enter index for Update :');
          int index = int.parse(stdin.readLineSync() ?? '0');
          stdout.write('Enter value for Update :');
          int val = int.parse(stdin.readLineSync() ?? '0');
          array[index] = val;
        } else {
          print('Please Enter Some Element into Array');
        }
        break;
      case 4:
        print(array);
        break;
      case 0:
        print('Thank You For Your Support');
        break;
      default:
        print('Your Input is not Valid Please Re-Enter !!');
    }
  } while (choice != 0);
}
