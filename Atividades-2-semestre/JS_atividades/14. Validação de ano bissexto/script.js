let ano = parseInt(prompt("Escolha um ano: "));

let bissexto = (ano % 400 === 0) || (ano % 4 === 0 && ano % 100 !== 0);

console.log(bissexto ? "É bissexto" : "Não é bissexto");