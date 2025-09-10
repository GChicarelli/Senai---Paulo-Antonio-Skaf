let numeroAleatorio = Math.floor (Math.random()* 100)
console.log(numeroAleatorio)

let numeroUsuario = parseInt(prompt("Tente adivinhar um número: "))

while (numeroUsuario != numeroAleatorio) { 
    if (numeroUsuario > numeroAleatorio) {
        alert ('O número ${numeroUsuario} é maior que o número.')
        numeroUsuario = parseInt(prompt("Você errou!  Tente novamente: "))
    } else (numeroUsuario > numeroAleatorio) 
    alert (`O número ${numeroUsuario} é menor ue o número.`)
    numeroUsuario = parseInt(prompt("Você errou! tente novamnte: "))
      
     break;
}
console.log ("Você acertou! 🥳")
