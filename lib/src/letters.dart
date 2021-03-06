/*
Harpo by Alexander Abraham
licensed under the MIT license
*/

/// This function gets the position of a letter
/// in the alphabet.
int encryptLetter(int factor, String letter) {
  int result = 1;
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
      result = (myList.indexOf(letter) + 1) * factor;
      break;
    } else {}
  }
  return result;
}

/// This function gets the letter from a position
/// in the alphabet.
String decryptLetter(int factor, int encryptedLetter) {
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
  for (var i = 0; i < myList.length; i++) {
    int origIndex = (encryptedLetter / factor).round() - 1;
    if (i == origIndex) {
      result = myList[i].toString();
      break;
    } else {}
  }
  return result;
}

/// This function takes a word and returns
/// a number sequence. These numbers are a
/// multiple of the corresponding letter's
/// position in the alphabet.
String encryptWord(int factor, String word) {
  List<String> encryptedChars = [];
  List<String> charList = word.split('');
  for (var i = 0; i < charList.length; i++) {
    String result = encryptLetter(factor, charList[i]).toString();
    encryptedChars.add(result);
  }
  String newlyEncryptedString = encryptedChars.join('|');
  return newlyEncryptedString;
}

/// This function returns a word from a sequence of numbers
/// corresponding to the each letter's position in the alphabet.
String decryptWord(int factor, String encryptedWord) {
  List<String> decryptedChars = [];
  List<String> charList = encryptedWord.split('|');
  for (var i = 0; i < charList.length; i++) {
    String result = decryptLetter(factor, int.parse(charList[i]));
    decryptedChars.add(result);
  }
  String newlyDecryptedString = decryptedChars.join('');
  return newlyDecryptedString;
}

/// This function does to phrases what their counterparts
/// do to words.
String encryptPhrase(int factor, String phrase) {
  List<String> encryptedWords = [];
  List<String> wordList = phrase.split(' ');
  for (var i = 0; i < wordList.length; i++) {
    String result = encryptWord(factor, wordList[i]);
    encryptedWords.add(result);
  }
  String newlyEncryptedString = encryptedWords.join('=>');
  return newlyEncryptedString;
}

/// This function does to phrases what their counterparts
/// do to words.
String decryptPhrase(int factor, String encryptedPhrase) {
  List<String> decryptedWords = [];
  List<String> wordList = encryptedPhrase.split('=>');
  for (var i = 0; i < wordList.length; i++) {
    String result = decryptWord(factor, wordList[i]);
    decryptedWords.add(result);
  }
  String newlyDecryptedString = decryptedWords.join(' ');
  return newlyDecryptedString;
}

/// This function tests all of the available functions..
void testAll() {
  int factor = 5;
  String testLetter = 'A';
  String testWord = 'TEST';
  String testPhrase = 'HELLO WORLD';
  int encryptedLetter = encryptLetter(factor, testLetter);
  String encryptedWord = encryptWord(factor, testWord);
  String encryptedPhrase = encryptPhrase(factor, testPhrase);
  String decryptedLetter = decryptLetter(factor, encryptedLetter);
  String decryptedWord = decryptWord(factor, encryptedWord);
  String decryptedPhrase = decryptPhrase(factor, encryptedPhrase);
  print(encryptedLetter);
  print(encryptedWord);
  print(encryptedPhrase);
  print(decryptedLetter);
  print(decryptedWord);
  print(decryptedPhrase);
}
