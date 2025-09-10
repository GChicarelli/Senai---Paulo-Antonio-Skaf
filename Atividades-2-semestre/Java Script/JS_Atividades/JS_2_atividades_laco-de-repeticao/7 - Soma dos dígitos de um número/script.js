let numero = parseInt(prompt("Digite um número inteiro positivo: "))
let soma = 0

if (numero >= 0) {
    while (numero > 0) { 
        soma += numero % 10; 
        numero = Math.floor(numero / 10) 
    }
    console.log ("A soma dos digitos é: " + soma)
} else { 
    console.log ("O número precisa ser inteiro e positivo")
}