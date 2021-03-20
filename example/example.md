# EXAMPLE FOR HARPO

Here is the example's `pubspec.yml`:
```YAML
name: test
description: A test app for harpo!
version: 1.0.0
homepage: https://github.com/iamtheblackunicorn/Harpo
publish_to: none
environment:
  sdk: '>=2.12.0 <3.0.0'
dependencies:
  harpo:
    git: git://github.com/iamtheblackunicorn/Harpo.git
dev_dependencies:
  harpo:
    git: git://github.com/iamtheblackunicorn/Harpo.git
```

Here is the example itself:

```dart
/*
Harpo by Alexander Abraham
licensed under the MIT license
*/
import 'package:harpo/harpo.dart';
// You could also just copy and paste any of the functions
// from the docs and use Harpo like this:
void main() {
  String encryptedLetter = encryptLetterBinary(5,'A');
  print(encryptedLetter);
}
// and then run it with "dart myprogram.dart"
```
