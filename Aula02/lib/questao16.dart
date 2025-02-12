// 16. Exceções: Crie um programa que tente dividir um número por zero e trate o
// erro

void main() {
  double numerador = 1;
  double denominador = 0;

  try {
    double res = dividir(numerador, denominador);
    print("> $res");
  } catch (e) {
    print("[Erro] $e");
  }
}

double dividir(double numerador, double denominador) {
  if (denominador == 0) {
    throw Exception("Nao e possivel dividir $numerador por 0");
  } else {
    return numerador / denominador;
  }
}