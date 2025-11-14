let array = ["a", "b", "c"]
//           p0   p1   p2

// i = 0 -> i = 1 -> i = 2
for (let i = 0; i < 3; i++){
    console.log(array[i]);
}

for (let numero = 1; numero <= 1000; numero++) {
     let soma = 0;

    for (let i = 1; i < numero; i++) {
         if (numero % i === 0) {
             soma += i;
         }
     }

     if (soma === numero) {
         console.log(numero + " é um número perfeito");
     }
 }