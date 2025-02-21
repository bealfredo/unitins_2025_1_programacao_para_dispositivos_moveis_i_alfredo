## aula 2 - 14.02

- Dart:
  - é uma linguagem single tread

- mixin
  - pode usar para gravar log


## aula 03 - 21.02

- Event Loop
  - é um loop que fica verificando se tem algo para ser executado
  - sem travar a thread principal
  - toda ação assíncrona é colocada nessas fila
  - monta duas filas: 

### microtask queue
  - tem prioridade
  - todas dessa fila são executadas antes do event quee

### Event queue
  - normalmente para requisições externas
  - ex: Future.delayed


1
9
6
8
3
5
4
2
7

