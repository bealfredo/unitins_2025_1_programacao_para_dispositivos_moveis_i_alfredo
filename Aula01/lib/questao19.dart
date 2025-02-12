// 19. Herança: Crie uma classe Animal com um método emitirSom(), e classes
// Cachorro e Gato que herdam Animal e implementam emitirSom().

class Animal {
  String nome;
  String cor;
  int idade;

  Animal(this.nome, this.cor, this.idade);

  void emitirSom() {
    print("ajsnaposijanoisusbausbouabusoaubo");
  }
}

class Cachorro extends Animal {
  Cachorro(super.nome, super.cor, super.idade);

  @override
  void emitirSom() {
    print("au au");
  }
}

class Gato extends Animal {
  Gato(super.nome, super.cor, super.idade);

  @override
  void emitirSom() {
    print("miaiu");
  }
}

void main() {
  Cachorro cachorrinho1 = Cachorro("Bilu", "Amarelo", 1);
  Gato gatinho1 = Gato("Chanin", "Preto", 2);

  cachorrinho1.emitirSom();
  gatinho1.emitirSom();
}