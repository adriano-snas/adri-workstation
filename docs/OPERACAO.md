# Operação e recuperação

## Rotina

Execute `./workstation status` para conferir a plataforma e `./workstation doctor` após atualizações importantes. O timer realiza backup diário por volta de 03:30 e conserva 30 dias.

O backup pausa n8n, Redis e PostgreSQL por alguns instantes para produzir um ponto consistente. Ollama não entra no backup porque os modelos podem ser baixados novamente e costumam ocupar muitos gigabytes.

## Atualização

`./workstation update` atualiza o Linux, Flatpaks e imagens. Não há atualizador automático de containers: uma mudança só ocorre quando você executa esse comando, depois de criar um backup.

Antes de uma atualização manual relevante, rode `./workstation backup`.

## Restauração total

1. Instale Linux Mint 22.x em amd64.
2. Clone este repositório e execute `./workstation install`.
3. Copie um backup para o computador.
4. Execute `./workstation restore /caminho/backup.tar.gz`.
5. Execute `./workstation doctor`.

A restauração valida todos os arquivos antes de alterar a instalação. Ela substitui os dados atuais dos serviços contemplados pelo conteúdo do backup.

## Tailscale

O cliente é instalado, mas não é conectado automaticamente. Para entrar na sua rede privada, execute `sudo tailscale up`. Os serviços permanecem em localhost por segurança; publique apenas um serviço específico e somente quando necessário.

## Solução de problemas

- Após instalar, saia e entre na sessão para que o grupo `docker` seja aplicado.
- Veja logs com `./workstation logs n8n` (troque o nome pelo serviço).
- Confira espaço com `df -h` e estado do SSD com `sudo smartctl -a /dev/nvme0n1` (ajuste o dispositivo).
- Nunca edite ou compartilhe `~/.local/share/adri-workstation/.env`.
- Não use `docker compose down -v`: a opção `-v` remove os dados.
