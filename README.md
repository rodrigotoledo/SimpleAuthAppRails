# SimpleAuthApp

Este é um projeto básico em Rails com autenticação de usuário usando `bcrypt`, cobertura de testes com `RSpec` e `SimpleCov`, além de monitoramento de arquivos com `Guard`.

## Configuração do Projeto

Siga os passos abaixo para instalar e realizar alterações no código

### Dependências

- Ruby on Rails
- SQLite (banco de dados)
- bcrypt (para hash de senha)
- RSpec (para testes)
- SimpleCov (para cobertura de testes)
- Guard (para monitoramento automático de testes)

### Instalação

1. Clone o repositório:

```bash
git clone https://github.com/rodrigotoledo/simple_auth_app.git
cd simple_auth_app
```

2. Instale as dependências:

```bash
bundle install
```

3. Configure o banco de dados e rode as migrations:

```bash
rails db:create db:migrate
```

4. Popule o banco de dados com o usuário seed:

```bash
rails db:seed
```

### Executando o Projeto

Inicie o servidor Rails:

```bash
rails server
```

Acesse o aplicativo em http://localhost:3000.

### Testes

Para rodar os testes com cobertura, execute:

```bash
bundle exec rspec
```

Para monitorar arquivos e executar testes automaticamente com Guard:

```bash
bundle exec guard
```

### Funcionalidades

- Autenticação de usuário com bcrypt.
- Cobertura de testes com SimpleCov.
- Testes de modelo para validação de email e senha.
- Filtros de cobertura para arquivos irrelevantes (channels, jobs, mailers).

## Licença

Este projeto é de uso livre.