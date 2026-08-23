# Adri Workstation

Instalação única, idempotente e segura de uma estação Linux Mint 22.x para desenvolvimento, automação e IA local.

## O que instala

- Docker Engine e Compose (repositório oficial)
- Portainer, n8n, PostgreSQL, Redis, Ollama e Open WebUI
- Git, Python, Node.js LTS, VS Code, Brave, DBeaver, Obsidian e Tailscale
- firewall, atualizações automáticas e otimizações seguras para SSD
- backup diário com retenção e teste de restauração

Os serviços web ficam restritos a `127.0.0.1`; não são publicados na rede local nem na internet.

## Instalação

Em um terminal, dentro deste repositório:

```bash
chmod +x workstation
./workstation install
```

Reinicie a sessão quando solicitado. Depois:

```bash
./workstation status
```

Endereços:

| Serviço | Endereço |
|---|---|
| n8n | http://127.0.0.1:5678 |
| Portainer | https://127.0.0.1:9443 |
| Open WebUI | http://127.0.0.1:3000 |
| Ollama | http://127.0.0.1:11434 |

Na primeira abertura, crie os usuários administradores do n8n, Portainer e Open WebUI. O primeiro usuário do Open WebUI torna-se administrador. Use senhas exclusivas; como as portas aceitam apenas conexões do próprio computador, o cadastro não fica disponível na rede.

## Operação

```bash
./workstation start       # inicia a plataforma
./workstation stop        # para a plataforma
./workstation update      # atualiza sistema, aplicativos e containers
./workstation backup      # cria backup consistente
./workstation restore ARQUIVO.tar.gz
./workstation logs n8n
./workstation doctor      # diagnóstico completo
```

Dados e configuração local ficam em `~/.local/share/adri-workstation`. Backups ficam em `~/Backups/adri-workstation`. O arquivo de segredos nunca entra no Git.

## Recuperação

Em uma instalação nova: clone o repositório, execute `./workstation install` e depois `./workstation restore CAMINHO_DO_BACKUP.tar.gz`. Consulte [docs/OPERACAO.md](docs/OPERACAO.md).

## Garantias do projeto

- repetir `install`, `start`, `stop`, `update` e `backup` é seguro;
- nenhum segredo possui valor padrão;
- PostgreSQL e Redis não publicam portas no host;
- imagens usam o canal principal estável ou LTS indicado pelo fornecedor e são atualizadas somente pelo comando explícito `update`;
- o backup inclui banco, volumes e manifesto de integridade;
- nenhuma remoção automática de dados é realizada.
