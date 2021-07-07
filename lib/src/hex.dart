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

/// This function converts
/// numbers of base 10 into
/// numbers of base 16.
String decToHex(int dec){
  String result = '';
  int base = 16;
  List<String> nums = [];
  List<String> alphabet = '123456789ABCDEF'.split('');
  int digit = 0;
  int remainder = base + 1;
  while (remainder > base){
    digit = dec~/base;
    remainder = dec - (digit * base);
    nums.add(digit.toString());
    if (remainder > 16) {}
    else {
      nums.add(alphabet[remainder-1]);
      break;
    }
  }
  result = nums.join('');
  return result;
}

/// Test function for converting
/// hexadecimals to decimal numbers.
void testHexToDec() {
  String hex = 'FA';
  int result = hexToDec(hex);
  
  print('$hex => $result');
  print('$result => ${decToHex(result)}');
}
