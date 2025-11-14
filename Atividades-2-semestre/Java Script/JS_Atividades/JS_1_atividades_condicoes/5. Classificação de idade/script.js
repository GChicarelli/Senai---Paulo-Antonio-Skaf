let idade = parseInt(prompt("Digite sua idade: "));

if (idade >= 0 && idade <= 12) {
    console.log("Criança");
} else if (idade >= 13 && idade <= 17) {
    console.log ("Adolescente");    
}else { 
    console.log("Adulto");
}