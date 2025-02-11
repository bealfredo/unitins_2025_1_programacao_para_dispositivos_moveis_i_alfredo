// 18. Encapsulamento: Modifique a classe Carro para que modelo seja privado e
// crie métodos getter e setter.

// note: para restringir realmente o acesso é necessário separá-los em arquivos ou bibliotecas diferentes

class Carro {
  String _marca;
  String _modelo;
  int _ano;

  Carro(this._marca, this._modelo, this._ano);


  String get marca => _marca;
  set marca(String novoValor) {
    _marca = novoValor;
  }

  String get modelo => _modelo;
  set modelo(String novoValor) {
    _modelo = novoValor;
  }

  int get ano => _ano;
  set ano(int novoValor) {
    _ano = novoValor;
  }

  void exibirInformacoes() {
    print("[Marca = $marca | Modelo = $modelo | Ano = $ano]");
  }
}

void main() {
  Carro carrinho1 = Carro("Toyota", "Corolla", 2025);
  Carro carrinho2 = Carro("Honda", "Civic", 2024);

  carrinho1.exibirInformacoes();
  carrinho2.exibirInformacoes();
}
