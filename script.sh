# !/bin/bash

clear

ARQUIVO_ALUNOS='alunos.txt'

# Functions
group()
{
    echo
    echo
    echo "    ########################################################"
    echo "    #                                                      #"
    echo "    #   Feito por:                                         #"
    echo "    #     150005185 - Marco Aurélio Ferreira da Silva      #"
    echo "    #     130003300 - Leonardo Vinícius Macedo dos Santos  #"
    echo "    #                                                      #"
    echo "    ########################################################"
    echo
    echo
}

menu()
{
    clear

    echo
    echo "  Olá!"
    echo "  Escolha uma opção abaixo para este script executar! =)"
    echo 
    echo "  ====="
    echo
    echo "  1 - Ordenar por ordem alfabética os nomes do arquivo e exportar em um novo arquivo"
    echo "  2 - Encontrar o nome de um aluno fornecendo o RA"
    echo "  3 - Ordenar por RA e exportar em um novo arquivo"
    echo "  4 - Sair"
    echo 
    read -p "Escolha uma opção: " OP
}

opError()
{
    clear

    echo
    echo "  * ------------------------------------------ *"
    echo "      Ops! Você escolheu uma opção inválida!"
    echo "      Tente novamente..."
    echo "      Tecle para continuar..."
    echo "  * ------------------------------------------ *"
    echo

    read
    clear
}

exitProgram()
{
    clear
    echo
    echo "  Saindo..." 
    echo "  Valeu!!"
    echo "  Aquele abraço!!"
    echo
    group
    exit
}

orderByName()
{
    echo
    echo "   OK... Vamos lá..."
    echo
    echo
    echo "   - Ordenando por RA..."
    
    sort $ARQUIVO_ALUNOS > alunos_sort_ra.txt

    echo "   - Pronto!"
    echo "      (Acesse o arquivo: alunos_sort_ra.txt)"
    echo
    echo "   Exibindo ordenação:"
    echo
    cat alunos_sort_ra.txt | sed 's/^/\t/'
}

orderByRa()
{
    echo
    echo "   OK... Vamos lá..."
    echo
    echo
    echo "   Ordenando por NOME..."
    
    cat $ARQUIVO_ALUNOS | sed 's/\([0-9]*\)\,\(.*\)/\2,\1/Ig' > tmp.txt
    sort tmp.txt > alunos_sort_name.txt
    rm tmp.txt

    echo "   - Pronto!"
    echo "      (Acesse o arquivo: alunos_sort_name.txt)"
    echo
    echo "   Exibindo ordenação:"
    echo
    cat alunos_sort_name.txt | sed 's/^/\t/'
}

findByRa()
{
    echo
    echo "   OK... Primeiro preciso do RA desse aluno..."
    echo
    read -p "   Qual o RA desse aluno? " RA
    

    if grep -q $RA $ARQUIVO_ALUNOS; then
        echo "   Olha o que encontramos:"
        echo 
        grep $RA $ARQUIVO_ALUNOS | sed 's/\([0-9]*\)\,\(.*\)/\tRA:\1\n\tNome:\2/Ig'
    else 
        echo
        echo "   Ops..."
        echo "   Não encontramos nada..."
        echo "   Mais sorte na próxima!"
    fi
}

# Main
main()
{
    menu

    clear
    
    case $OP in
        1) orderByName ;;
        2) findByRa ;;
        3) orderByRa ;;
        4) exitProgram ;;
        *) opError ;;
    esac

    echo 
    echo    "   ---------------------"
    read -p "     Continuar? (s/n) " OP
    
    if [ $OP = 'n' ]; then
        exitProgram
    fi
}


group
read -p "Tecle para continuar... "
clear

OP=0
while :; do
    main

    if [ $OP = 4 ]; then
        break
    fi
    
done
