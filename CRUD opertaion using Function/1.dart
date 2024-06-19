import 'dart:io';

void main() {
  int choice;
  List<int> array = [];

  do {
    print('Enter 1 to insert an element at the end of the list');
    print('Enter 2 to delete an element from the list');
    print('Enter 3 to update an element in the list');
    print('Enter 4 to view elements of the list');
    print('Enter 0 to exit');
    choice = int.parse(stdin.readLineSync() ?? '0');

    switch (choice) {
      case 1:
        insert(array: array);
        break;
      case 2:
        delete(array: array);
        break;
      case 3:
        update(array: array);
        break;
      case 4:
        view(array: array);
        break;
      case 0:
        print('Thank you for using the program.');
        break;
      default:
        print('Invalid input. Please try again.');
    }
  } while (choice != 0);
}

void insert({required List<int> array}) {
  stdout.write('Enter element to insert: ');
  int n = int.parse(stdin.readLineSync() ?? '0');
  array.add(n);
  print('$n has been added to the list.');
}

void delete({required List<int> array}) {
  if (array.isNotEmpty) {
    stdout.write('Enter element to remove: ');
    int n = int.parse(stdin.readLineSync() ?? '0');
    if (array.contains(n)) {
      array.remove(n);
      print('$n has been removed from the list.');
    } else {
      print('$n is not in the list.');
    }
  } else {
    print('The list is empty. Please insert some elements first.');
  }
}

void update({required List<int> array}) {
  if (array.isNotEmpty) {
    stdout.write('Enter index to update: ');
    int index = int.parse(stdin.readLineSync() ?? '0');
    if (index >= 0 && index < array.length) {
      stdout.write('Enter new value: ');
      int val = int.parse(stdin.readLineSync() ?? '0');
      array[index] = val;
      print('Element at index $index has been updated to $val.');
    } else {
      print('Invalid index. Please enter a valid index.');
    }
  } else {
    print('The list is empty. Please insert some elements first.');
  }
}

void view({required List<int> array}) {
  print('Current list: $array');
}
