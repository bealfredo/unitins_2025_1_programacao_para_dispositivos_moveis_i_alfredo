// 22. Stream: Crie uma Stream que emita números de 1 a 5 com intervalo de 1
// segundo entre eles

import 'dart:async';

void main() {
  Stream<int> stream = Stream<int>.periodic(Duration(seconds: 1), (x) => x + 1).take(5);

  stream.listen((event) {
    print(event);
  });
}