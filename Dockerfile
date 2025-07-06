# Use Python 3.13 slim para melhor compatibilidade e menor tamanho
FROM python:3.13-slim

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Instale dependências do sistema necessárias para SQLAlchemy e outras libs
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copie o arquivo de dependências primeiro (para aproveitar o cache do Docker)
COPY requirements.txt .

# Instale as dependências Python
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copie todo o código da aplicação
COPY . .

# Crie o diretório para o banco SQLite e ajuste permissões
RUN mkdir -p /app/data && chmod 755 /app/data

# Exponha a porta 8000 (porta padrão do FastAPI/Uvicorn)
EXPOSE 8000

# Configure as variáveis de ambiente
ENV PYTHONPATH=/app
ENV PYTHONUNBUFFERED=1

# Execute a aplicação
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]