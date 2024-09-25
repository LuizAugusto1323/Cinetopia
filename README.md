# Cinetopia

A aplicação Cinetopia é um aplicativo iOS que exibe a lista de filmes com maior arrecadação de bilheteria dos últimos tempos, utilizando a linguagem Swift e o framework UIKit, com a abordagem programática (view code).

## 🔨 Funcionalidades do projeto

- Listagem dos filmes com maior arrecadação de bilheteria dos últimos tempos;
- Exibição detalhada de um filme;
- Filtragem dos filmes de acordo com a busca do usuário;
- Favoritar/desfavoritar um filme.

## ✔️ Técnicas e tecnologias

**Veja abaixo o que utilizamos nesse projeto**:
- UIKit: Framework para construção de interfaces de usuário;
- XCode: Ambiente de desenvolvimento integrado (IDE) oficial da Apple para desenvolvimento de aplicativos iOS;
- Swift: Linguagem de programação poderosa e intuitiva usada para desenvolver aplicativos iOS;
- View code: Abordagem programática para construção de interfaces de usuário, sem o uso de storyboards;
- `UINavigationController`: Utilizado para navegação entre telas;
- `UIButton, UIImageView, UILabel, UIStackView`: Componentes de interface de usuário para construção das telas.
- `UITableView`: Componente para construção de tabelas.
- `UITableViewDataSource`, `UITableViewDelegate`: Protocolos para construção de tabelas.
- `UISearchBar`, `UISearchBarDelegate`: Componente e protocolo para construção de barras de pesquisa.
- `UITableViewCell`: Construção de células para tabelas

E muito mais! 

## 🛠️ Abrir e rodar o projeto

**Para executar este projeto, você precisa:**

- Ter um macOS rodando em sua máquina.
- Ter a IDE XCode instalada em sua máquina. Você pode baixar pela App Store ou no [site para desenvolvedores](https://developer.apple.com/download/all/) da Apple.

**Como executar o projeto?**

Quando você realizar o download do projeto, deverá descompactar o arquivo e entrar na pasta descompactada. Dentro dessa pasta, haverá um arquivo com a extensão `.xcodeproj`, você deve dar duplo clique nesse arquivo, que abrirá diretamente no XCode. 

Com o projeto aberto no XCode, você consegue visualizar todas as pastas e arquivos.

Para rodar o seu projeto, você deve clicar no botão de play na parte superior do XCode. Você também pode alterar o simulador em que o aplicativo será exibido, e então, o projeto será aberto no simulador de sua preferência.

## 1. Baixe o Repositório da API

Antes de tudo, precisamos ter o código da API em sua máquina. O projeto da API fica na pasta `Util` do projeto.

## 2. Instale o NodeJS

Se você ainda não possui o NodeJS instalado, é a hora de baixá-lo. Acesse o [site oficial do NodeJS](https://nodejs.org), faça o download da versão recomendada e siga os passos da instalação.

Você precisa ter o NodeJS instalado na sua máquina, pois a API é feita com NodeJS, um ambiente de execução JavaScript do lado do servidor, permitindo o desenvolvimento de aplicações web escaláveis e assíncronas.

> **Nota**: Não se preocupe se você não souber Javascript ou NodeJS! O objetivo aqui é apenas executar a nossa API, de onde vamos consumir os dados, salvar agendamentos de consulta, etc.

## 3. Execute a API

Para executar a API, siga os passos abaixo:

1. Abra o terminal.
2. Navegue até o diretório onde baixou o projeto da API, utilizando o comando:
   
    `cd <caminho-para-o-projeto>`

3. Execute o seguinte comando para instalar todas as dependências do projeto:
   
    `npm install -g json-server`

4. Para iniciar a API, digite:
   
    `json-server --watch db.json`
   
Pronto! Agora a API estará rodando localmente em sua máquina e estará pronta para receber as requisições de nosso projeto iOS.
