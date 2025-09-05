let numero1 = parseInt(prompt("Digite o primeiro número: "));
let numero2 = parseInt(prompt("Digite o segundo número: "));
let operacao = prompt("Escolha a operação (+, -, *, /): "); 
let resultado;

if (operacao === "+") {
    resultado = numero1 + numero2;
    console.log (`O resultado de é ${resultado}`);
}   else if (operacao === "-") {
    resultado = numero1 - numero2;
    console.log (`O resultado de é ${resultado}`);
}   else if (operacao === "*") {
    resultado = numero1 * numero2;
    console.log (`O resultado de é ${resultado}`);
}   else if (operacao === "/") {
    if (numero2 !== 0) {
        resultado = numero1 / numero2;
        console.log (`O resultado de é ${resultado}`);
    } else {
        console.log("Erro: Divisão por zero não é permitida.");
    } 
 }