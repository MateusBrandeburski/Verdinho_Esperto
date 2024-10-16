#!/bin/bash

REPO_DIR="$HOME/robos-coletas/verdinho"
FILE_PATH="$REPO_DIR/arquivo.txt"
LOG_FILE="/var/log/automacoes/verdinho_esperto_out.log"

cd $REPO_DIR || { echo "Diretório do repositório não encontrado!" | tee -a $LOG_FILE; exit 1; }

if [ ! -f "$FILE_PATH" ]; then
  echo "Arquivo não encontrado!" | tee -a $LOG_FILE
  exit 1
fi

echo "" >> $FILE_PATH
git add $FILE_PATH 2>&1 | tee -a $LOG_FILE

COMMIT_MESSAGE=$(date +"%d/%m/%Y às %H:%M:%S")
git commit -m "$COMMIT_MESSAGE" 2>&1 | tee -a $LOG_FILE
git push origin main 2>&1 | tee -a $LOG_FILE
