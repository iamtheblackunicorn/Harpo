/*
Harpo by Alexander Abraham
licensed under the MIT license
*/

import 'dart:math';

/// This function converts a binary
/// number of type <String> to a decimal number
/// of type <String>. It multiplies each digit
/// by a power of 2.
String binToDec(String binaryNumber) {
  List<String> origDigitsList = binaryNumber.split('');
  List<String> digitsList = List.from(origDigitsList.reversed);
  int lenDigitsList = digitsList.length;
  int decimalSum = 0;
  for (var i = 0; i < lenDigitsList; i++) {
    if (digitsList[i] == '1') {
      int toAdd = pow(2, i).toInt();
      decimalSum = decimalSum + toAdd;
    } else {}
  }
  String result = decimalSum.toString();
  return result;
}

/// This function converts a decimal
/// number of type <int> to a binary number
/// of type <String>. It keeps dividing
/// by 2 until it hits 0.
String decToBin(int decimalNumber) {
  List<String> endChars = [];
  int dec = decimalNumber;
  int initItem = dec % 2;
  String startDigit = initItem.toString();
  endChars.add(startDigit);
  while ((dec ~/ 2).toInt() != 0) {
    dec = (dec ~/ 2).toInt();
    int itemOneToAdd = dec % 2;
    String itemTwoToAdd = itemOneToAdd.toString();
    endChars.add(itemTwoToAdd);
  }
  var reversedChars = List.from(endChars.reversed);
  String result = reversedChars.join('');
  return result;
}

/// This function encrypts letters as binary numbers,
/// not decimal numbers.
String encryptLetterBinary(int factor, String letter) {
  String result = 'pass';
  List<String> myList = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  for (var i = 0; i < myList.length; i++) {
    if (myList[i] == letter) {
      result = decToBin(((myList.indexOf(letter) + 1) * factor));
      break;
    } else {}
  }
  return result;
}

/// This function decrypts letters as binary numbers,
/// not decimal numbers.
String decryptLetterBinary(int factor, String encryptedLetter) {
  List<String> myList = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  String result = '';
  int origIndex =
      (int.tryParse(binToDec(encryptedLetter))! ~/ factor).round() - 1;
  for (var i = 0; i < myList.length; i++) {
    if (i == origIndex) {
      result = myList[i].toString();
      break;
    } else {}
  }
  return result;
}

// This function takes a word and returns
/// a binary number sequence. These binary numbers are a
/// multiple of the corresponding letter's
/// position in the alphabet.
String encryptWordBinary(int factor, String word) {
  List<String> encryptedChars = [];
  List<String> charList = word.split('');
  for (var i = 0; i < charList.length; i++) {
    String result = encryptLetterBinary(factor, charList[i]).toString();
    encryptedChars.add(result);
  }
  String newlyEncryptedString = encryptedChars.join('|');
  return newlyEncryptedString;
}

/// This function returns a word from a sequence of binary numbers
/// corresponding to the each letter's position in the alphabet.
String decryptWordBinary(int factor, String encryptedWord) {
  List<String> decryptedChars = [];
  List<String> charList = encryptedWord.split('|');
  for (var i = 0; i < charList.length; i++) {
    String result = decryptLetterBinary(factor, charList[i]);
    decryptedChars.add(result);
  }
  String newlyDecryptedString = decryptedChars.join('');
  return newlyDecryptedString;
}

/// This function does to phrases what their counterparts
/// do to words. Only in binary.
String encryptPhraseBinary(int factor, String phrase) {
  List<String> encryptedWords = [];
  List<String> wordList = phrase.split(' ');
  for (var i = 0; i < wordList.length; i++) {
    String result = encryptWordBinary(factor, wordList[i]);
    encryptedWords.add(result);
  }
  String newlyEncryptedString = encryptedWords.join('=>');
  return newlyEncryptedString;
}

/// This function does to phrases what their counterparts
/// do to words. Only in binary.
String decryptPhraseBinary(int factor, String encryptedPhrase) {
  List<String> decryptedWords = [];
  List<String> wordList = encryptedPhrase.split('=>');
  for (var i = 0; i < wordList.length; i++) {
    String result = decryptWordBinary(factor, wordList[i]);
    decryptedWords.add(result);
  }
  String newlyDecryptedString = decryptedWords.join(' ');
  return newlyDecryptedString;
}

/// This functions tests all of the above binary functions.
void testAllBinary() {
  int factor = 5;
  String testLetter = 'A';
  String testWord = 'TEST';
  String testPhrase = 'HELLO WORLD';
  String binaryNumber = '101';
  String functionBinary = decToBin(factor);
  String functionDecimal = binToDec(binaryNumber);
  String encryptedLetter = encryptLetterBinary(factor, testLetter);
  String encryptedWord = encryptWordBinary(factor, testWord);
  String encryptedPhrase = encryptPhraseBinary(factor, testPhrase);
  String decryptedLetter = decryptLetterBinary(factor, encryptedLetter);
  String decryptedWord = decryptWordBinary(factor, encryptedWord);
  String decryptedPhrase = decryptPhraseBinary(factor, encryptedPhrase);
  print(encryptedLetter);
  print(encryptedWord);
  print(encryptedPhrase);
  print(decryptedLetter);
  print(decryptedWord);
  print(decryptedPhrase);
  print(functionBinary);
  print(functionDecimal);
}
