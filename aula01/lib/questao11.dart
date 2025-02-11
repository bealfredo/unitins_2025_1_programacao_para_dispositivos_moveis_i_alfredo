// 11. Função Simples: Crie uma função que receba dois números e retorne a
// soma deles.

void main() {
  double num1 = 1;
  double num2 = 2;

  print("> $num1 + $num2 = ${soma(num1, num2)}");
}

double soma(double num1, double num2) {
  return num1 + num2;
}