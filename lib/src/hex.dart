/*
Harpo by Alexander Abraham
licensed under the MIT license
*/

import 'dart:math';

/// Convert hexadecimals to
/// decimal numbers.
String hexToDec(String hexNumber) {
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
  return result.toString();
}

/// This function converts
/// numbers of base 10 into
/// numbers of base 16.
String decToHex(int dec) {
  String result = '';
  int base = 16;
  List<String> nums = [];
  List<String> alphabet = '123456789ABCDEF'.split('');
  int digit = 0;
  int remainder = base + 1;
  while (remainder > base) {
    digit = dec ~/ base;
    remainder = dec - (digit * base);
    if (digit > base) {
      nums.add(digit.toString());
    } else {
      if (digit > 9) {
        nums.add(alphabet[digit - 1]);
      } else {
        nums.add(digit.toString());
      }
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

/// This function encrypts letters as hexadecimal numbers,
/// not decimal numbers.
String encryptLetterHex(int factor, String letter) {
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
      result = decToHex(((myList.indexOf(letter) + 1) * factor));
      break;
    } else {}
  }
  return result;
}

/// This function decrypts letters as hexadecimal numbers,
/// not decimal numbers.
String decryptLetterHex(int factor, String encryptedLetter) {
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
      (int.tryParse(hexToDec(encryptedLetter))! ~/ factor).round() - 1;
  for (var i = 0; i < myList.length; i++) {
    if (i == origIndex) {
      result = myList[i].toString();
      break;
    } else {}
  }
  return result;
}

// This function takes a word and returns
/// a hexadecimal number sequence. These hexadecimal numbers are a
/// multiple of the corresponding letter's
/// position in the alphabet.
String encryptWordHex(int factor, String word) {
  List<String> encryptedChars = [];
  List<String> charList = word.split('');
  for (var i = 0; i < charList.length; i++) {
    String result = encryptLetterHex(factor, charList[i]).toString();
    encryptedChars.add(result);
  }
  String newlyEncryptedString = encryptedChars.join('|');
  return newlyEncryptedString;
}

/// This function returns a word from a sequence of hexadecimal numbers
/// corresponding to the each letter's position in the alphabet.
String decryptWordHex(int factor, String encryptedWord) {
  List<String> decryptedChars = [];
  List<String> charList = encryptedWord.split('|');
  for (var i = 0; i < charList.length; i++) {
    String result = decryptLetterHex(factor, charList[i]);
    decryptedChars.add(result);
  }
  String newlyDecryptedString = decryptedChars.join('');
  return newlyDecryptedString;
}

/// This function does to phrases what their counterparts
/// do to words. Only in hexadecimal.
String encryptPhraseHex(int factor, String phrase) {
  List<String> encryptedWords = [];
  List<String> wordList = phrase.split(' ');
  for (var i = 0; i < wordList.length; i++) {
    String result = encryptWordHex(factor, wordList[i]);
    encryptedWords.add(result);
  }
  String newlyEncryptedString = encryptedWords.join('=>');
  return newlyEncryptedString;
}

/// This function does to phrases what their counterparts
/// do to words. Only in hexadecimal.
String decryptPhraseHex(int factor, String encryptedPhrase) {
  List<String> decryptedWords = [];
  List<String> wordList = encryptedPhrase.split('=>');
  for (var i = 0; i < wordList.length; i++) {
    String result = decryptWordHex(factor, wordList[i]);
    decryptedWords.add(result);
  }
  String newlyDecryptedString = decryptedWords.join(' ');
  return newlyDecryptedString;
}

/// This functions tests all of the above hexadecimal functions.
void testAllHex() {
  int factor = 5;
  String testLetter = 'A';
  String testWord = 'TEST';
  String testPhrase = 'HELLO WORLD';
  String hexNumber = 'FA';
  String functionHex = decToHex(factor);
  String functionDecimal = hexToDec(hexNumber);
  String encryptedLetter = encryptLetterHex(factor, testLetter);
  String encryptedWord = encryptWordHex(factor, testWord);
  String encryptedPhrase = encryptPhraseHex(factor, testPhrase);
  String decryptedLetter = decryptLetterHex(factor, encryptedLetter);
  String decryptedWord = decryptWordHex(factor, encryptedWord);
  String decryptedPhrase = decryptPhraseHex(factor, encryptedPhrase);
  print(encryptedLetter);
  print(encryptedWord);
  print(encryptedPhrase);
  print(decryptedLetter);
  print(decryptedWord);
  print(decryptedPhrase);
  print(functionHex);
  print(functionDecimal);
}
