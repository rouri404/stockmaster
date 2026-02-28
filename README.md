# README

# StockMaster 📦

<p align="center">
  <a>
    <img src="./assets/stockmaster_banner.png" alt="StockMaster" width="100%"/>
  </a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Ruby%20on%20Rails-CC0000?style=flat&logo=ruby-on-rails&logoColor=white" alt="Rails">
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=flat&logo=postgresql&logoColor=white" alt="Postgres">
  <img src="https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white" alt="Docker">
</p>

---

## Sobre

O **StockMaster** é um motor de gerenciamento de inventário focado em integridade de dados e alta disponibilidade de estoque. Desenvolvido para resolver gargalos de controle em ambientes de micro-serviços, o sistema permite o monitoramento de ativos, gestão de validades e controle de precificação com alta precisão decimal.

Diferente de planilhas convencionais, o StockMaster utiliza uma arquitetura isolada em containers, permitindo que a infraestrutura de banco de dados e a lógica de negócio escalem de forma independente.

## Stack

- **Runtime**: Ruby 3.x / Rails 7.x
- **Database**: PostgreSQL 15
- **Container**: Docker + Docker Compose
- **Environment**: WSL2 (Windows Subsystem for Linux)

## Arquitetura de Dados

O sistema utiliza o PostgreSQL como fonte única da verdade. A tabela `Products` foi desenhada com foco em auditoria:

- `name`: Identificador nominal do ativo.
- `quantity`: Saldo de estoque (inteiro).
- `price`: Valor unitário com precisão `decimal` (evitando erros de arredondamento financeiros).
- `category`: Agrupamento lógico de itens.
- `brand`: Rastreabilidade de fabricante.
- `timestamps`: Auditoria nativa de criação e última modificação.

## Quick Start

### Pré-requisitos

- Docker & Docker Compose
- WSL2 (Recomendado para Windows)

### Executando com Docker

```bash
# Clone o repositório
git clone [https://github.com/seu-usuario/stock-master.git](https://github.com/seu-usuario/stock-master.git)
cd stock-master

# Copie o arquivo de exemplo e configure as variáveis de ambiente
cp .env.example .env

# Subir os containers (Database + Web)
docker compose up -d

# Criar banco e rodar migrations (e popular seeds)
docker compose exec web rails db:prepare
```

### Variáveis de Ambiente

Copie `.env.example` para `.env` e configure:

| Variável | Descrição | Padrão |
| :--- | :--- | :--- |
| `POSTGRES_PASSWORD` | Senha do banco de dados | `password` |
| `POSTGRES_USER` | Usuário do banco | `postgres` |
| `POSTGRES_DB` | Nome do banco de desenvolvimento | `app_development` |
| `RAILS_MAX_THREADS` | Threads do Rails | `5` |


## ⚙️ Configurações de Acesso

A aplicação estará disponível em: [http://localhost:3000](http://localhost:3000)

<details>
<summary>Clique para ver detalhes de conexão e auditoria</summary>

### Conexão Externa (DBeaver / Database Audit)

Utilize os seguintes parâmetros no DBeaver:

| Parâmetro | Valor |
| :--- | :--- |
| **Host** | `localhost` |
| **Porta** | `5432` |
| **User** | `postgres` |
| **Password** | `password` |
| **Database** | `app_development` |

</details>
