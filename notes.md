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

## Aula - 07.03

### notes

- iremos trabalhar com widgets
- um container só pode ter um filho
- o row pode ter n filhos

### criando o projeto

- baixar android studio
- puglins
  - dart
  - flutter
- criar projeto
  - flutter
  - lingaguem kotlin
  - plataformas: android e ios
- tem como colocar para executar no navegador

### widgets catalog
- https://docs.flutter.dev/ui/widgets

### Tamanho relativo

```dart
FractionallySizedBox(
  widthFactor: 0.8,
  child: Container(
    alignment: AlignmentDirectional.center,
    color: Colors.orange,
    height: 40,
    child: Text(
      'APP',
      style: TextStyle(
        color: Colors.black,
        fontSize: 32,
      ),
    ),
  ),
),
```

### alinhamento no column

```dart
Align(
  alignment: AlignmentDirectional.centerStart,
  child: Stack(
    alignment: AlignmentDirectional.center,
    children: [
      Container(
        color: Colors.red,
        width: 200,
        height: 200,
      ),
      Container(
        color: Colors.blue,
        width: 100,
        height: 100,
      ),
    ]
  ),
),
```