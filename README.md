# Harpo :lock:

[![Build Status](https://travis-ci.com/iamtheblackunicorn/Harpo.svg?branch=main)](https://travis-ci.com/iamtheblackunicorn/Harpo)

*A Dart package for numeric encryption/decryption and binary encryption/decryption! :lock:*

## About :books:

Harpo is a small library to numerically decrypt/encrypt letters, words, and phrases! Harpo is written in Dart and I thought I'd practise some Dart.

## Installation :inbox_tray:

### Adding to your project

To add Harpo to your project's dependencies, add this to your project's `pubspec.yml`:

#### From *GitHub*

```YAML
dependencies:
  ...
  harpo:
    git: git://github.com/iamtheblackunicorn/harpo.git
```

#### From *Pub.dev*

```YAML
dependencies:
  ...
  harpo: ^1.1.7-nullsafety.0
```

The three dots represent anything else that you might have in the `dependencies` section.
Having done that, re-fetch your project's dependencies by running this in the project's root directory:

```bash
$ dart pub get
```

## Usage :hammer:

### Importing

Import the numeric encryption like this:

```dart
import 'package:harpo/harpo.dart';
```

#### API for numeric encryption

##### int encryptLetter(int factor, String letter)

This function encrypts a letter and expects a factor of type integer and a letter of type string. The function returns an integer.

##### String decryptLetter(int factor, int encryptedLetter)

This function decrypts a letter and expects a factor of type integer and a letter of type integer. This function returns a string.

##### String encryptWord(int factor, String word)

This function encrypts a word and expects a factor of type integer and a word of type string. The function returns a string of integers of type string.

##### String decryptWord(int factor, String encryptedWord)

This function decrypts an encrypted word and expects a factor of type integer and an encrypted word of type string. The function returns a string of letters of type string.

##### String encryptPhrase(int factor, String phrase)

This function encrypts a phrase and expects a factor of type integer and a phrase of type string. The function returns a string of integers of type string.

##### String decryptPhrase(int factor, String encryptedPhrase)

This function decrypts an encrypted phrase and expects a factor of type integer and an encrypted phrase of type string. The function returns a string of letters of type string.

##### String binToDec(String binaryNumber)

This function converts a binary number of type string into a decimal number of type string.

##### String decToBin(int decimalNumber)

This function converts a decimal number of type integer into a binary number of type string.

##### void testAll()

This function tests all of the above and prints out their results.

#### API for binary encryption

##### String binToDec(String binaryNumber)

This function takes a binary number of type string as input and returns a decimal number of type string.

##### String decToBin(int decimalNumber)

This function takes a decimal number of type integer and returns a binary number of type string.

##### String encryptLetterBinary(int factor, String letter)

This function encrypts a letter in binary of type string. The index of the letter in the alphabet is multiplied with a factor of
type integer and turned into a binary number. This binary number of type string is then returned.

##### String decryptLetterBinary(int factor, String encryptedLetter)

This function decrypts a letter in binary of type string. The binary is converted to a decimal number, divided by the factor
of type integer and then matched to a letter from the alphabet.

##### String encryptWordBinary(int factor, String word)

This function encrypts a word in binary of type string. All letters are then multiplied by the factor and converted to
binary numbers.

##### String decryptWordBinary(int factor, String word)

This function decrypts a word in binary of type string. All letters are then divided by the factor and reverse-converted to
letters. This assortment of letters is then returned as a string.

##### String encryptPhraseBinary(int factor, String phrase)

This function encrypts all the words in a phrase in binary!

##### String decryptPhraseBinary(int factor, String phrase)

This function decrypts all the words in a phrase from binary to alphanumeric characters!

##### void testAllBinary()

This function tests all of the above!

## Note :scroll:

- Harpo by Alexander Abraham a.k.a. *The Black Unicorn*
- licensed under the MIT license
