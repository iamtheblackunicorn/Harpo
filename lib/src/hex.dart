/*
Harpo by Alexander Abraham
licensed under the MIT license
*/

import 'dart:math';

/// Convert hexadecimals to
/// decimal numbers.
int hexToDec(String hexNumber) {
  int base = 16;
  int result = 0;
  String digitSetString = '0123456789ABCDEF';
  List<String> digitSet = digitSetString.split('');
  List<String> hexCharsBase = hexNumber.split('');
  List<String> hexChars = List.from(hexCharsBase.reversed);
  for (int i = 0; i < hexChars.length; i++) {
    String hexChar = hexChars[i];
    if (digitSet.contains(hexChar) == true) {
      int posMul = digitSet.indexOf(hexChar);
      int posPower = pow(base, i).toInt();
      int posProduct = posMul * posPower;
      result = result + posProduct;
    } else {
      throw 'Illegal character found!';
    }
  }
  return result;
}

/// Test function for converting
/// hexadecimals to decimal numbers.
void testHexToDec() {
  String hex = 'FA';
  var result = hexToDec(hex);
  print('$hex => $result');
}
