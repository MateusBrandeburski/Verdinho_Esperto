#!/bin/bash

REPO_DIR="$HOME/verdinho"
FILE_PATH="$REPO_DIR/arquivo.txt"
LOG_FILE="$REPO_DIR/log.txt"  # Adicionei uma definição para LOG_FILE

# Mensagem a ser adicionada ao arquivo
MESSAGE="Adicionando nova entrada em $(date +"%d/%m/%Y às %H:%M:%S")"

# Adiciona a mensagem ao arquivo
echo "$MESSAGE" >> "$FILE_PATH"

# Adiciona o arquivo ao staging
git add "$FILE_PATH" 2>&1 | tee -a "$LOG_FILE"

# Cria mensagem de commit com data e hora
COMMIT_MESSAGE=$(date +"%d/%m/%Y às %H:%M:%S")
git commit -m "$COMMIT_MESSAGE" 2>&1 | tee -a "$LOG_FILE"

# Faz o push para o repositório
git push origin main 2>&1 | tee -a "$LOG_FILE"

