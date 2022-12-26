# Lottery

App RESTful API, aonde os usuários podem se registrar com um nome e email e participar de sorteios.

## Sumário

- [Como executar a aplicação](#como-executar-a-aplicação)
- [Ferramentas para ambiente local](#ferramentas-para-ambiente-local)
- [Guias](#guias)
- [Requests](#requests)
________________________________________________________________________________________________

### Como executar a aplicação
- Versão mínima do Elixir para rodar o projeto "1.12"
- Necessário PostgreSQL rodando na porta 5432 (caso rodando em outra porta, é necessário alteração nas configurações da aplicação)
- O hostname do banco varia conforme guia de opções [Ferramentas para ambiente local](#ferramentas-para-ambiente-local)
1. "db" para Docker
2. "localhost" para as demais

- Para iniciar o servidor 
Execute a task para criar o banco e rodar as migrations

``` shell
mix ecto.setup
```

Iniciar o servidor Phoenix

``` shell
mix phx.server
```

Iniciar o servidor Phoenix em modo interativo
``` shell
iex -S mix phx.server
```

### Ferramentas para ambiente local

Este projeto possui três opções para ambientes de desenvolvimento:

1. [Docker](./guides/local/docker.md)
2. [Nix](./guides/local/nix.md)
3. [asdf](./guides/local/asdf.md)

---

### Guias

- [Cobertura de Testes](./guides/test_coverage.md)
- [Testes de integração](./guides/integration_tests.md)

### Requests

É necessária a dependência [RestClient](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) para executar as requests.

- [Exemplo de Requests e Collection](./requests.http)
