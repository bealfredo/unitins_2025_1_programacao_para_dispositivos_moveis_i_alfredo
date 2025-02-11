// 17.Classe e Objeto: Crie uma classe Carro com propriedades marca, modelo
// e ano, e um método para exibir as informações.

class Carro {
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
  Carro carrinho2 = Carro("Honda", "Civic", 2024);

  carrinho1.exibirInformacoes();
  carrinho2.exibirInformacoes();
}