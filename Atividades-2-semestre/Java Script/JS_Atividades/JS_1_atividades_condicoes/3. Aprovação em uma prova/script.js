let nota = parseInt(prompt("Digite a nota: "));

if (nota >= 60 && nota <= 100) {
    console.log("Aprovado");
} else if (nota >= 0 && nota < 60) {
    console.log("Reprovado");
} else {
    console.log ("Valor inválido")
}



