import 'dart:io';

void startTimer({
  required int startMin,
  required int endMin,
  required int startSec,
  required int endSec,
}) {
  if (startMin > endMin || (startMin == endMin && startSec > endSec)) {
    print('Invalid time range.');
    return;
  }

  print('$startMin : $startSec');

  if (startMin == endMin && startSec == endSec) {
    return;
  }

  Future.delayed(Duration(seconds: 1), () {
    startSec++;
    if (startSec == 60) {
      startSec = 0;
      startMin++;
    }

    startTimer(
      startMin: startMin,
      endMin: endMin,
      startSec: startSec,
      endSec: endSec,
    );
  });
}

void main() {
  stdout.write('Enter starting minutes: ');
  int startMinutes = int.parse(stdin.readLineSync() ?? '0');

  stdout.write('Enter starting seconds: ');
  int startSeconds = int.parse(stdin.readLineSync() ?? '0');

  stdout.write('Enter ending minutes: ');
  int endMinutes = int.parse(stdin.readLineSync() ?? '0');

  stdout.write('Enter ending seconds: ');
  int endSeconds = int.parse(stdin.readLineSync() ?? '0');

  startTimer(
    startMin: startMinutes,
    endMin: endMinutes,
    startSec: startSeconds,
    endSec: endSeconds,
  );
}
