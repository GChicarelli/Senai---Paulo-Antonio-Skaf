let numero = parseInt(prompt("Digite umnúmero: "))
let numero_invertido = 0

let flag_negativo = false 
if (numero < 0 ) {
    numero *= -1
    flag_negativo = true 
}
    
while (numero > 0 ){
    let unidade = numero % 10; 
    numero_invertido = unidade + numero_invertido * 10
    numero = (numero - unidade) / 10
}

if (flag_negativo) numero_invertido *= -1
alert ("A inverção é " + numero_invertido)
