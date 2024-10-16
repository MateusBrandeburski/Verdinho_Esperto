import subprocess
import os

# Caminho para o script shell
script_path = '/home/mateusbrandeburski/robos-coletas/Verdinho_Esperto/verdinho_esperto.sh'
# Caminho para o arquivo de log
log_file_path = '/var/log/automacoes/verdinho_esperto_out.log'

# Função para executar o script e registrar a saída
def execute_script(script_path, log_file_path):
    try:
        # Executar o script shell
        result = subprocess.run(
            [script_path],
            capture_output=True,
            text=True,
            check=True,
            shell=True
        )
        # Escrever a saída e o erro (se houver) no arquivo de log
        with open(log_file_path, 'a') as log_file:
            log_file.write(f"Saída do comando:\n{result.stdout}\n")
            if result.stderr:
                log_file.write(f"Erros do comando:\n{result.stderr}\n")
    except subprocess.CalledProcessError as e:
        # Registrar erros no arquivo de log
        with open(log_file_path, 'a') as log_file:
            log_file.write(f"Erro ao executar o comando:\n{e}\n")

# Garantir que o diretório de log existe
os.makedirs(os.path.dirname(log_file_path), exist_ok=True)

# Executar o script
execute_script(script_path, log_file_path)
