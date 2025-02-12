// 20.Mixin: Crie um mixin chamado Volante e aplique-o a uma classe Carro.

// notesbyme: Em Dart, um mixin é uma forma de reutilizar código de várias classes, 
// permitindo que você adicione funcionalidades específicas a uma classe
// sem usar herança múltipla.

mixin Volante {
  void virarDireita() {
    print("Virando para a direita...");
  }

  void virarEsquerda() {
    print("Virando para a esquerda...");
  }
}

class Carro with Volante {
  String marca;
  String modelo;
  int ano;

  Carro(this.marca, this.modelo, this.ano);

  void exibirInformacoes() {
    print("[Marca = $marca | Modelo = $modelo | Ano = $ano]");
  }
}

void main() {
  Carro carrinho1 = Carro("Toyota", "Corolla", 2025);

  carrinho1.exibirInformacoes();
  carrinho1.virarDireita();
  carrinho1.virarEsquerda();
}