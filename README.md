# dotfiles
## Instalação
```sh
git clone https://github.com/silva-guimaraes/dotfiles
```
```sh
git submodule update --init --recursive
```
## Rodar
```sh
ansible-playbook main.yml
```
## Créditos
Inspirado em [dezeroku/arch_ansible](https://github.com/dezeroku/arch_ansible).

Até pouco tempo seguia a mesma filosofia que outros repositórios de ter todos os arquivos de configuração com
base na `$HOME` do usuário como worktree principal, mas não estava contente com a organização pois são poucos os
programas que seguem a especificação [XDG Base Directory](https://specifications.freedesktop.org/basedir/latest/)
(é ela quem dita a existência do diretório de configuração `.config` do usuário) e poluem a `$HOME` com vários dotfiles
por conta disso.
