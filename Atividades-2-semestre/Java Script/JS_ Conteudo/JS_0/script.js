const prompt = require("prompt-sync")(); // Importa o módulo prompt-sync para entrada de dados pelo usuário

// ! Estrutura Condicional

// if / else 

let temperatura = 12; // Define a variável temperatura com valor 12

if (temperatura > 25 ) { // Verifica se a temperatura é maior que 25
    console.log ("Está calor!"); // Se verdadeiro, exibe "Está calor!"
} else {
    console.log ("Está frio!"); // Se falso, exibe "Está frio!"
}

let nomeUsuario = prompt("Digite seu nome: "); // Solicita ao usuário que digite seu nome
console.log("Seu nome é " + nomeUsuario); // Exibe o nome digitado pelo usuário

// if / else if / else 

let nota = parseInt(prompt("Digite a nota: ")); // Solicita ao usuário que digite uma nota e converte para inteiro

if (nota > 6) { // Verifica se a nota é maior que 6
    console.log ("Aprovado!"); // Se verdadeiro, exibe "Aprovado!"
} else if (nota == 6) { // Se a nota for igual a 6
    console.log ("Recuperação!"); // Exibe "Recuperação!"
} else {
    console.log ("Reprovado(a)!"); // Se nenhuma das anteriores, exibe "Reprovado(a)!"
}

// if Ternário

let saldo = 90; // Define a variável saldo com valor 90

let podeComprar = saldo >= 100 ? "Compra aqprovada!" : "Saldo insuficiente"; // Operador ternário para verificar se o saldo é suficiente
console.log (podeComprar); // Exibe o resultado da verificação

// Condicional Aninhada
// Multplas verificações 

let hora = 10; // Define a variável hora com valor 10
let diaDaSemana = "terça" // Define o dia da semana como "terça"
if (hora >= 9 && hora < 12) { // Verifica se a hora está entre 9 e 12
    console.log ("Bom dia!"); // Se verdadeiro, exibe "Bom dia!"
} else {
    if (hora >=12 && hora > 18) { // Verifica se a hora está entre 12 e 18
        if (diaDaSemana == "segunda") { // Verifica se o dia da semana é segunda
            console.log ("Boa Tarde! Ótima semana!"); // Se verdadeiro, exibe mensagem especial
        } else {
            console.log ("Boa Tarde!"); // Se não for segunda, exibe "Boa Tarde!"
        }
    } else {
        console.log ("Boa Noite!"); // Se não for tarde, exibe "Boa Noite!"
    }
}

// switch case

let dia = 2; // Define a variável dia com valor 2
switch (dia) { // Estrutura switch para verificar o valor de dia
    case 1:
        console.log ("Domingo"); // Se dia for 1, exibe "Domingo"
        break;
    case 2: 
        console.log ("Segunda-feira"); // Se dia for 2, exibe "Segunda-feira"
        break;
    case 3:
        console.log ("Terça-feira"); // Se dia for 3, exibe "Terça-feira"
        break;
    default: 
        console.log ("Dia inválido"); // Se não for nenhum dos anteriores, exibe "Dia inválido"
}


