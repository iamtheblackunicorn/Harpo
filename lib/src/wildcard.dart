/*
Harpo by Alexander Abraham
licensed under the MIT license
*/

/// Convert numbers of any base to
/// decimal numbers. A custom base
/// and alphabet need to be fed into
/// the function.
int customToDec(String customNumber, String alphabet, int base) {
  int result = 0;
  String digitSetString = alphabet;
  List<String> digitSet = digitSetString.split('');
  List<String> customCharsBase = customNumber.split('');
  List<String> customChars = List.from(customCharsBase.reversed);
  for (int i = 0; i < customChars.length; i++) {
    String customChar = customChars[i];
    if (digitSet.contains(customChar) == true) {
      int posMul = digitSet.indexOf(customChar);
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
/// numbers of a custom base.
/// A character set and base
/// need to be supplied.
String decToCustom(String customAlphabet, int base, int dec) {
  String result = '';
  List<String> nums = [];
  List<String> alphabet = customAlphabet.split('');
  int digit = 0;
  int remainder = base + 1;
  while (remainder > base) {
    digit = dec ~/ base;
    remainder = dec - (digit * base);
    if (digit > base) {
      nums.add(digit.toString());
    } else {
      nums.add(alphabet[digit - 1]);
    }
    if (remainder > base) {
    } else {
      nums.add(alphabet[remainder - 1]);
      break;
    }
  }
  result = nums.join('');
  return result;
}

void testWildCard() {
  String customAlphabet = 'ABCDEFGHIJKLMNOPQ';
  int customBase = 18;
  int testNumber = 45;
  String customNumber = decToCustom(customAlphabet, customBase, testNumber);
  int resultNumber = customToDec(customNumber, customAlphabet, customBase);
  print(customNumber);
  print(resultNumber);
  if (testNumber == resultNumber) {
    print(true);
  } else {
    print(false);
  }
}
