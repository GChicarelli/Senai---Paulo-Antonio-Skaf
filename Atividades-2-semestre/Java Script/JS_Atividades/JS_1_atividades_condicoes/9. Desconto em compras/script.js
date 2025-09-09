let valor = parseInt(prompt("Quanto custou a roupa? "));

if (valor > 100) {
    valor *= 0.9;
    console.log("Ganhou desconto de 10%")
}

console.log("O preço fica então: " + valor)