# G79931 - Desenvolvimento de Sistemas para Dispositivos Móveis

## Sobre

Repositório de código da disciplina **Desenvolvimento de Sistemas para Dispositivos Móveis** do curso noturno, [Técnico em Desenvolvimento de Sistemas, Lauro de Freitas, SENAI](https://www.tecnicosenai.com.br/cursos/desenvolvimento-de-sistemas/).

No Google Classroom da turma tem o link para o slide da disciplina.

## GIT

O GIT é um sistema de controle de versão distribuído e gratuito. É usado em muitas empresas para gerenciar as versões do projetos.

> **$** - *significa que o comando é executado como usuário sem permissão de administrador*.

### 1. Comandos úteis

A seguir temos alguns comandos úteis **git** que são usados durante o desenvolvimento:

```shell
git init #inicia o controle de versão do projeto
```

```shell
git clone <URL do projeto> #Clona o projeto remoto para local
```

```shell
git config --global user.name "Seu nome" #adiciona o nome do autor
```

```shell
git config --global user.email "meuemail@provedor.com" #adiciona o e-mail do autor
```

```shell
git status #visualiza informações dos arquivos do projeto
```

```shell
git log #visualiza a lista de commits
```

```shell
git add <Nome do arquivo ou pasta> #add arquivos na área de preparação (Staged Area)
```

```shell
git commit -m "<Descrição resumida das mudanças>" #confirma e salva as mudanças dos arquivos na Staged Area
```

```shell
git remote add <nome do remote> <URL do projeto> #Add link para repositório remoto
```

```shell
$ git checkout <nome da branch>  #muda de branch;
```

```shell
$ git checkout -b <nome da branch> #cria e muda de branch; se já existir a branch, dá erro;
```

```shell
$ git push origin <nome da branch> #envia as mudanças que foram dadas commit para o servidor;
```

```shell
$ git pull origin <nome da branch> #baixa as mudanças realizadas do servidor;
```

### 2. Dica: fluxo diário de desenvolvimento

Você que é iniciante, pode seguir as dicas abaixo para diminuir a quantidade de problemas na atualização do seu projeto.

#### 2.1. Antes de começar a codificar

##### 2.1.1. Verificar se está na branch que deseja modificar.

```shell
$ git branch
```

#### 2.1.2. Atualizar o repositório local com as mudanças que estão no servidor:

```shell
$ git pull origin <branch atual>
```

**OBS**: antes deste comando é recomendado que verifique a branch atual (`item 2.1.1`), pois se estiver em uma branch A e executar este comando utilizando a branch B será feito o MERGE da branch B com a A.

#### 2.2. Antes de colocar as informações no servidor, atualize o repositório local (`item 2.1.2`).
