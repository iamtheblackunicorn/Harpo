import 'dart:math';

/// Convert hexadecimals to
/// decimal numbers.
int hexToDec(String hexNumber){
  int base = 16;
  int result = 0;
  String digitSetString = '0123456789ABCDEF';
  List<String> digitSet = digitSetString.split('');
  List<String> hexCharsBase = hexNumber.split('');
  List<String> hexChars = new List.from(hexCharsBase.reversed);
  for (int i = 0; i < hexChars.length; i++) {
    String hexChar = hexChars[i];
    if (digitSet.contains(hexChar) == true){
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
void testHexToDec(){
  String hex = '100';
  var result = hexToDec(hex);
  print('$hex => $result');
}

/// Convert a decimal number
/// into a hexadecimal number.
String decToHex(int decimalNumber){
  String result = 'hello';
  return result;
}

/// Test function for converting
/// decimal numbers into hexadecimals.
void testDecToHex(){
  int decimalNumber = 256;
  String result = decToHex(decimalNumber);
  print('$decimalNumber => $result');
}

void main(){
  testHexToDec();
  //testDecToHex();
}
