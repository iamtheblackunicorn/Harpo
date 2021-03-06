build: ; cd .. && tar -cvzf Harpo.tgz Harpo && mv Harpo.tgz Harpo && ls
test: ; dart pub get && dart analyze && cd example && cd lib && dart main.dart --greet Alex
