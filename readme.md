# Imersão DevOps - Alura Google Cloud

Este projeto é uma API desenvolvida com FastAPI para gerenciar alunos, cursos e matrículas em uma instituição de ensino.

## Pré-requisitos

- [Python 3.10 ou superior instalado](https://www.python.org/downloads/)
- [Git](https://git-scm.com/downloads)
- [Docker](https://www.docker.com/get-started/)

## Passos para subir o projeto

1. **Faça o download do repositório:**
   [Clique aqui para realizar o download](https://github.com/guilhermeonrails/imersao-devops/archive/refs/heads/main.zip)

2. **Crie um ambiente virtual:**

   - No Linux/Mac:

   ```sh
   python3 -m venv ./venv
   ```

   - No Windows:

   ```sh
   python -m venv ./venv
   ```

3. **Ative o ambiente virtual:**

   - No Linux/Mac:

     ```sh
     source venv/bin/activate
     ```

   - No Windows:

     ```sh
     source venv/Scripts/activate
     ```

4. **Instale as dependências:**

   ```sh
   pip install -r requirements.txt
   ```

5. **Execute a aplicação:**

   ```sh
   uvicorn app:app --reload
   ```

6. **Acesse a documentação interativa:**

   Abra o navegador e acesse:  
   [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)

   Aqui você pode testar todos os endpoints da API de forma interativa.

---

## Executando com Docker

Se você preferir usar Docker, siga estes passos:

### Primeira execução

1. **Construa e execute a aplicação:**

   ```sh
   docker-compose up --build
   ```

### Execuções posteriores

Após a primeira execução, você não precisa mais usar `--build`:

```sh
# Executar normalmente (com logs no terminal)
docker-compose up

# Executar em segundo plano
docker-compose up -d
```

### Para parar a aplicação

```sh
# Para a aplicação e remove os containers
docker-compose down

# Para parar sem remover (apenas pausa)
docker-compose stop
```

### Usando Docker diretamente

1. **Construa a imagem:**

   ```sh
   docker build -t api-imersao-alura .
   ```

2. **Execute o container:**

   ```sh
   # Com persistência de dados (recomendado)
   docker run -p 8000:8000 -v ./data:/app/data api-imersao-alura

   # Ou sem persistência (dados são perdidos ao parar o container)
   docker run -p 8000:8000 api-imersao-alura
   ```

**Acesse a documentação:** [http://localhost:8000/docs](http://localhost:8000/docs)

### Verificando se está funcionando

Após executar o Docker, você pode verificar se a aplicação está rodando:

```sh
# Ver containers em execução
docker ps

# Ver logs da aplicação
docker-compose logs -f api
```

Se tudo estiver funcionando, você verá algo como:

```sh
api-imersao-alura | INFO: Uvicorn running on http://0.0.0.0:8000
```

### Comandos úteis do Docker

**Para parar a aplicação:**

```sh
# Docker Compose
docker-compose down

# Docker direto (use Ctrl+C no terminal ou)
docker stop <container-id>
```

**Para ver containers em execução:**

```sh
docker ps
```

**Para ver logs da aplicação:**

```sh
# Docker Compose
docker-compose logs -f

# Docker direto
docker logs <container-id> -f
```

**Para executar comandos dentro do container:**

```sh
# Docker Compose
docker-compose exec api bash

# Docker direto
docker exec -it <container-id> bash
```

---

## Autenticando no Google Cloud

```sh
gcloud auth login
gcloud config set project PROJECT_ID
gcloud run deploy --port=8000
```

## Gerenciando recursos do Google Cloud

### Para evitar cobranças, encerre os recursos quando não estiver usando

**1. Parar/Deletar o serviço Cloud Run:**

```sh
# Listar serviços ativos
gcloud run services list

# Deletar um serviço específico
gcloud run services delete NOME_DO_SERVIÇO --region=REGIAO

# Exemplo:
gcloud run services delete api-imersao-alura --region=us-central1
```

**2. Verificar outros recursos ativos:**

```sh
# Ver todos os recursos que podem gerar cobrança
gcloud compute instances list
gcloud sql instances list
gcloud container clusters list
```

**3. Definir orçamento e alertas:**

- Acesse [Google Cloud Console](https://console.cloud.google.com/)
- Vá em "Faturamento" → "Orçamentos e alertas"
- Configure alertas para ser notificado sobre gastos

**4. Usar sempre o Free Tier:**

- Cloud Run: 2 milhões de solicitações/mês
- 180.000 GB-segundos de CPU/mês
- 360.000 GB-segundos de memória/mês

**5. Parar o projeto temporariamente:**

```sh
# Desabilitar APIs (isso para todos os serviços)
gcloud services disable run.googleapis.com
gcloud services disable cloudbuild.googleapis.com
```

**6. Deletar o projeto inteiro (CUIDADO!):**

```sh
# Isso remove TUDO do projeto
gcloud projects delete PROJECT_ID
```

### Comandos úteis para monitorar gastos

```sh
# Ver faturamento atual
gcloud billing accounts list

# Ver uso de recursos
gcloud logging read "resource.type=cloud_run_revision" --limit=10
```

**⚠️ IMPORTANTE:** Sempre verifique o [Google Cloud Console](https://console.cloud.google.com/) para confirmar que todos os recursos foram encerrados!

---

## Estrutura do Projeto

- `app.py`: Arquivo principal da aplicação FastAPI.
- `models.py`: Modelos do banco de dados (SQLAlchemy).
- `schemas.py`: Schemas de validação (Pydantic).
- `database.py`: Configuração do banco de dados SQLite.
- `routers/`: Diretório com os arquivos de rotas (alunos, cursos, matrículas).
- `requirements.txt`: Lista de dependências do projeto.

---

- O banco de dados SQLite será criado automaticamente como `escola.db` na primeira execução.
- Para reiniciar o banco, basta apagar o arquivo `escola.db` (isso apagará todos os dados).

---
