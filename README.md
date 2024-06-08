<h1 align="center" style="font-weight: bold;">Shop 📱</h1>

<p align="center">
 <a href="#demo">Demonstração</a> • 
 <a href="#tech">Tecnologias</a> • 
 <a href="#start">Iniciando</a> • 
 <a href="#structure">Estrutura</a> 
</p>

<p align="center">
    <b>O objetivo do aplicativo é desenvolver um sistema de gerenciamento de produtos que permita realizar as operações básicas de CRUD (Criar, Ler, Atualizar, Excluir).</b>
</p>

<h2 id="demo">📱Demontração</h2>

<p align="center">
    <img src="assets/demo.gif" alt="Image Example" height="400px">
</p>

<h2 id="tech">💻 Tecnologias</h2>

- Flutter 3.22.1
- Dart 3.4.1
- SQLite

<h2 id="start">🎖️ Iniciando</h2>

Para começar o projeto, certifique-se de ter o Dart e o Flutter configurados em sua máquina local.

1. **Navega para o projeto**:
    ```bash
    cd <project name>
    ```
2. **Limpe o cache**:
    ```bash
    flutter clean
    ```
3. **Instale as dependências**:
    ```bash
    flutter pub get
    ```
4. **Inicie o projeto**:
    ```bash
    flutter run --flavor dev
    ```


<h2 id="structure">📂 Estrutura </h2>

```
src/
 ├── assets/
 │   └── images
 │   └── fonts
 │   
 ├── lib/
 │   ├── core/
 │   │   ├── database/
 │   │   ├── di
 │   │   ├── extensions/
 │   │   └── mixin/
 │   │    
 │   ├── ini/
 │   │   ├── app.dart
 │   │   └── splash.dart
 │   │   
 │   ├── modules/
 │   │   └── product/
 │   │       ├── controller/
 │   │       ├── model/
 │   │       └── view/
 │   │       
 │   └── ui/
 │       ├── appBar/
 │       ├── buttons/
 │       ├── dialogs/
 │       ├── form/
 │       ├── indicator/
 │       ├── informatives/
 │       ├── shimmer/
 │       └── utils/
 │           ├── style/
 │           │   ├── images_network_path.dart
 │           │   └── utils.dart
 │           │   
 │           └── validator.dart
 │          
 └── main.dart
```