namespace Introduca_c_;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine ("Bem vindo(a) ao sistema"); 

        // Entrada de dados 
        Console.WriteLine ("Digite seu nome:"); 
        string nome = Console.ReadLine();

        Console.WriteLine ("Digite sua idade:");
        int idade = int.Parse(Console.ReadLine());

        Console.WriteLine ($"\nOlá, {nome}! Você tem {idade} anos.");

        if (idade < 18)
        {
            Console.WriteLine("Você ainda é menor de idade.");
        }
        else
        {
            Console.WriteLine("Você é maior de idade.");
        }

    // Menu 

    inicio:

        Console.WriteLine("\nEscolha uma opção: ");
        Console.WriteLine ("1 - Ver a tabuada de um número: ");
        Console.WriteLine("2 - Contar até um número:   "); 
        Console.WriteLine("3 - Fibonacci ");  
        Console.WriteLine ("4 - Sair");
        Console.WriteLine ("Digite sua opção: ");

        int opcao = int.Parse(Console.ReadLine());

        if (opcao == 1)
        {
            Console.WriteLine("Digite um número para ver a tabuada: ");
            int num = int.Parse(Console.ReadLine());

            Console.WriteLine($"\nTabuada de {num}: ");
            for (int i = 1; i <= 10; i++)
            {
                Console.WriteLine($"{num} x {i} = {num * i}");
            }
            Console.WriteLine("\n\nDeseja refazer as perguntas? (s/n)");
        string resposta = Console.ReadLine().ToLower();

            if (resposta == "s")
            {
                Console.Clear(); 
                goto inicio;     
            }else {
                Console.WriteLine("Encerrando o programa...");
            }
        }
        
        if (opcao == 2)
        {
            Console.WriteLine("Digite um número: ");
            int n = int.Parse(Console.ReadLine());

            Console.WriteLine($"\n Contando até {n}: ");
            for (int i = 1; i <= n; i++)
                Console.Write(i + " ");
            
            Console.WriteLine("\n\nDeseja refazer as perguntas? (s/n)");
        string resposta = Console.ReadLine().ToLower();

            if (resposta == "s")
            {
                Console.Clear(); 
                goto inicio;     
            }else {
                Console.WriteLine("Encerrando o programa...");
            }
            
        }

        if (opcao == 3)
        {
            Console.WriteLine("Digite um número : ");
            int n = int.Parse(Console.ReadLine());

            int a = 0, b = 1, c;

            Console.WriteLine($"Sequência de Fibonacci até {n}: ");
            Console.Write(a + " " + b + " ");

            for (int i = 2; i < n; i++)
            {
                c = a + b;
                Console.Write(c + " ");
                a = b;
                b = c;
            }
            Console.WriteLine("\n\nDeseja refazer as perguntas? (s/n)");
            string resposta = Console.ReadLine().ToLower();

            if (resposta == "s")
            {
                Console.Clear();
                goto inicio;
            }
            else
            {
                Console.WriteLine("Encerrando o programa...");
            }
        }
        
        if (opcao == 4)     

        Console.WriteLine("Encerrando o programa...");
       
        
    }
}

