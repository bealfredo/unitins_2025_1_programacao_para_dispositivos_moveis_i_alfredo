// void main() {
//   print("#01: inicio");

//   Future.delayed(Duration(seconds: 5), () => print("#02: Evemt Queue #1"));

//   Future.microtask(() => print("#03: Microtask Queue #1"));

//   Future.delayed(Duration(seconds: 1), () => print("#04: Evemt Queue #2"));

//   Future.microtask(() => print("#05: Microtask Queue #2"));

//   minhaFutureFunc();

//   print("#09: fim");
// }

// Future<int> minhaFutureFunc() async {
//   print("#06: inicio minhaFutureFunc");

//   await Future.delayed(Duration(seconds: 10), () => print("#07: minhaFutureFunc - Evemt Queue #3"));

//   print("#08: fim minhaFutureFunc");

//   return 1;
// }

// ----------------------------------------------------------------

void main() async {
  print("#01: inicio");

  Future.delayed(Duration(seconds: 5), () => print("#02: Demorado"));
  Future.delayed(Duration(seconds: 1), () => print("#03: Demorado"));

  await minhaFutureFunc();

  print("06: fim");
}

Future<int> minhaFutureFunc() async {
  await Future.delayed(Duration(seconds: 2), () => print("#04: minhaFutureFunc - Demorado"));
  Future.microtask(() => print("#05: minhaFutureFunc - Microtask"));
  return 1;
}

// ordem de execução: 1, 3, 4, 5, 2, 6