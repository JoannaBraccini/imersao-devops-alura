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

```
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
