//! FOR 
//! Contando de 1 até N

let n = parseInt(prompt("Digite um número: "));
for(let i = 1; i <= n; i++){
    console.log(i);
}

for(let i = n; i >= 0 ; i--){
    console.log(i);
}

//! WHILE 
//! Fazer uma soma

let soma = 0;
let i = 1;
while(i <= 10){
    soma += i; // -> soma = soma + i
    console.log("O resultado atual é : " + soma);
    i++;
}
console.log("A soma total dos 10 números é: " + soma);

//! DO / WHILE

let numero = 1;
do {
    console.log("Número: " + numero);
    numero++;
} while (numero <= 5);

//! FOREACH

let numeros = [1,2,3,4,5];
numeros.forEach(function(numero){
    console.log("Numero: " + numero);
});
let frutas = ["maçã", "banana" , "uva" , "pêra"];
frutas.forEach(function(fruta){
    console.log(fruta);
});

for(let i = 0 ; i < numeros.length; i++){
    console.log("Número: " + numeros[i]);
}

//*------------------------------------------------------------*\\

//!----------------------------FILTER----------------------------!\\

//! Filtrar números maiores que 2

 const numeros = [1, 2, 3, 4, 5, 6]
 const maioresQueDois = numeros.filter(numero => numero > 2)
 console.log(maioresQueDois)

//! Filtrar nomes

 let nomes = ["Ana", "Bruno", "Carlos", "Eva", "Fernanda"]
 let nomesLongos = nomes.filter(nome => nome.length > 5)
 console.log(nomesLongos)
//! Filtrar números pares

 let numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
 let pares = numeros.filter( numero => numero % 2 === 0)
 console.log(pares)

//! Filtrar um objeto
 let pessoas = [
     {nome: "Lucas" , idade: 17},
     {nome: "Mariana" , idade: 22},
     {nome: "Ana Catarina" , idade: 15},
     {nome: "Juliana" , idade: 30}
 ]
 let adultos = pessoas.filter(pessoa => pessoa.idade >= 18)
 console.log(adultos)



//!---------------------------FIND-------------------------------!\\ 

//! Retorna o primeiro elemento da lista correspondente a condição
//! Procurar um produto pelo preço

 const produtos = [
     {id: 1 , nome: "Teclado", preco: 100},
     {id: 2 , nome: "Mouse", preco: 50},
     {id: 3 , nome:"Monitor", preco: 700}
 ]
 const produtoCaro = produtos.find(produto => produto.preco > 600)
 console.log(produtoCaro)

//!Encontrar o primeiro numero maior que 10

 let numeros = [5, 8, 12, 20, 3, 15]
 let encontrado = numeros.find(numero => numero > 10)
 console.log(encontrado)

//! Encontrar um nome pela primeira letra

 let nomes = ["Ana", "Bruno", "Carlos", "Eva", "Cátia"]
 let nomeEncontrado = nomes.find(nome => nome.startsWith("C"))
 console.log(nomeEncontrado)



//!--------------------------MAP--------------------------------!\\

//! mutiplicar todos os numeros por 2 

const numeros = [1,2,3,4,5]

const numerosDobados = numeros.map(numero => numero * 2)
console.log (numerosDobrados)

//! criando um array a partir de objetos

let pessoas [ 
    {nome: "Lucas", idade: 17},
    {nome: "Mariana", idade: 22},
    {nome: "João", idade: 15}
]

let nomes = pessoas.map(pessoa => pessoa.nome)
console.log (nomes)

let mensagem = pessoas.map(pessoa => 
    `${pessoas.nome} tem ${pessoa.idade} anos.`
     )
     console.log (mensagem) 


//! Deixar os nomes em maiusculo e adiconar um sufixo 

const nomes = ["ana", "bruno", "carlos"]
const nomesMaiusculo = nomes.map(nome => "Colaboradoes: "+ nome.toUpperCase())
console.log (nomesMaiusculo)



//!------------------------------REDUCE---------------------------------!\\ 

//! Reduz um array a um unico valor 

const numeros = [1,2,3,4,5]
const soma = numeros.reduce((acumulador, numero)=> acumulador + numero, 0
)

console.log (soma)

//! Verificar o maior numero do array 

const numeros = [10, 5, 8, 20, 8]

const maiorNumero = numeros.reduce ((max, numero)=> {
    if (numero >= max){
        return numero
    } else {
        return max 
    }
}, numeoros [0]
)
console.log (maiorNumero)

//! Contar a frequencia de palavras 

const palavras = ["maçã", "banana", "maçã", "laranja", "banana", "maçã"]
const contagem = palavras.reduce ((acumulador, palavra) => {acumulador[palavra] = (acumulador[palavra] || 0 ) + 1},  {})

console.log(contagem)

//! Caucular nedia de notas

const notas = [7, 8, 9, 10]
const media = notas.reduce ((total, notas) => total + notas, 0) / notas.length
console.log (media)

//! Uso combinado

const usuarios = [
  {id: 1, nome: "Alice", idade: 25},
  {id: 2, nome: "Bob", idade: 30},
  {id: 3, nome: "Carol", idade: 20}
]

// filtrar usuarios com idade maior que 21
const maioresDeIdade = usuarios.filter(usuario => usuario.idade > 21)
// Encontrar o primero usuario com idade maior que 21 
const usuario = usuarios.find(usuario => usuario.idade > 21)
//cirar um array apenas com nomes de usuarios
const nomesUsuarios = ususarios.map (usuario => usuario.nome)
// Somar todas as idades dos usuariods usando o reduce 
const somaIdades = usuarios.reduce ((total, usuario) => total + ususario.idade, 0)

console.log("Maior de idade: " + maioresDeIdade);
console.log("Primeiro maior de idade: " + usuarioIdade);
console.log("Nomes dos usuários: " + nomesUsuarios);
console.log("Soma de idades: " + somaIdades);
