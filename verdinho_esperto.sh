#!/bin/bash

# Nome do arquivo a ser modificado
FILE_PATH="/home/usuario/Worldir/prioritario/Verdinho_Esperto/arquivo.txt"

# Verificar se o arquivo existe
if [ ! -f "$FILE_PATH" ]; then
  echo "Arquivo não encontrado!"
  exit 1
fi

# Adicionar uma quebra de linha ao final do arquivo
echo "" >> $FILE_PATH

# Adicionar o arquivo modificado ao stage do Git
git add $FILE_PATH

# Formatar a data e a hora no padrão brasileiro
COMMIT_MESSAGE=$(date +"%d/%m/%Y às %H:%M:%S")

# Fazer o commit com a mensagem especificada
git commit -m "$COMMIT_MESSAGE"

# Push das alterações para o repositório remoto
git push origin main
