// 8. Loop while: Some os números de 1 a 100 e exiba o resultado.

void main() {
  int soma = 0;
  int i = 1;

  while(i <= 100) {
    soma += i;
    i++;
  }

  print("> Soma = $soma");
}