# Sistema de Gestão de Almoxarifado (SGA) - Fabricante de Ferramenterr

## 1. Visão Geral do Projeto

Este projeto é um Sistema Multiplataforma (Web e Mobile) para Gestão de Estoque, desenvolvido com Flutter e Firebase. O objetivo é substituir o controle manual, resolver problemas de falta e excesso de estoque e garantir a rastreabilidade completa das movimentações de materiais no almoxarifado.

---

## 2. O Desafio (Contextualização)

A fabricante enfrenta desafios críticos na gestão de estoque devido à ausência de um sistema informatizado. Isso resulta em:
* Falta de produtos em momentos cruciais da produção.
* Excesso de estoque, gerando custos elevados e risco de obsolescência.
* Complexidade na gestão de itens com muitas variações (tamanho, peso, materiais, características especiais).

O objetivo é desenvolver uma ferramenta (Web ou Mobile) que permita ao almoxarifado cadastrar, visualizar e gerenciar intuitivamente a entrada e saída de produtos, com alertas de estoque mínimo e histórico completo de movimentações.

---

## 3. Funcionalidades Principais (Requisitos Funcionais)

O sistema implementa os seguintes módulos e funcionalidades:

### Módulo de Autenticação e Sessão
* **RF001:** Autenticação de usuário (login e senha) via Firebase Authentication.
* **RF002:** Feedback claro em caso de falha no login.
* **RF003:** Exibição do nome do usuário logado na interface principal.
* **RF004:** Funcionalidade de Logout segura.

### Módulo de Gestão de Produtos (CRUD)
* **RF005:** Cadastro, Edição e Exclusão de produtos no Cloud Firestore.
* **RF008:** Listagem automática (em tempo real) de todos os produtos.
* **RF010:** Campo de busca para filtrar produtos na tabela.
* **RF011:** Validação de formulários (campos obrigatórios, dados inválidos).
* **RF012:** Definição de nível de "Estoque Mínimo" por produto.

### Módulo de Gestão de Estoque
* **RF014:** Listagem de produtos em ordem alfabética.
* **RF015:** Registro de "Entrada" de estoque.
* **RF016:** Registro de "Saída" de estoque (com atualização atômica).
* **RF018:** Alerta visual imediato ao usuário se o estoque ficar abaixo do mínimo.

### Módulo de Rastreabilidade (Histórico)
* **RF019:** Registro de um histórico (log) completo para cada movimentação.
* **RF020:** Identificação do usuário (UID do Firebase) responsável pela movimentação.
* **RF021:** Registro da data e hora da operação (Timestamp do Firebase).
* **RF022:** Permite ao usuário informar uma data específica para a movimentação.

---

## 4. Stack de Tecnologia (Entrega 9)

* **Backend-as-a-Service (BaaS):** Google Firebase
* **Banco de Dados:** Cloud Firestore (NoSQL)
* **Autenticação:** Firebase Authentication
* **Linguagem:** Dart
* **Framework (Frontend Web/Mobile):** Flutter
* **Sistema Operacional (Desenvolvimento):** Windows / macOS / Linux

---

## 5. Modelo do Banco de Dados (Cloud Firestore - Entrega 2)

O diagrama abaixo (em sintaxe Mermaid) representa a estrutura NoSQL do Cloud Firestore, baseada em Coleções e Documentos.

```mermaid
graph TD
    subgraph Firebase
        Auth[Firebase Authentication]
        Store[Cloud Firestore]
    end

    subgraph Store [Cloud Firestore]
        direction TB

        C_Usuarios(<b>Coleção:</b><br/>Usuarios)
        D_Usuario(<b>Documento:</b><br/>{uid_do_usuario})
        D_Usuario_Data(<b>Dados:</b><br/>- nome_completo<br/>- email<br/>- (outros dados...))
        
        C_Produtos(<b>Coleção:</b><br/>Produtos)
        D_Produto(<b>Documento:</b><br/>{id_do_produto})
        D_Produto_Data(<b>Dados:</b><br/>- nome<br/>- descricao<br/>- peso_kg<br/>- dimensoes_cm<br/>- estoque_atual<br/>- estoque_minimo)
        
        C_Movimentacoes(<b>Coleção:</b><br/>Movimentacoes)
        D_Movimentacao(<b>Documento:</b><br/>{id_da_movimentacao})
        D_Movimentacao_Data(<b>Dados:</b><br/>- data_hora_operacao (Timestamp)<br/>- data_movimentacao (String/Data)<br/>- tipo ('Entrada' ou 'Saída')<br/>- quantidade<br/>- produto_id (Referência)<br/>- usuario_id (Referência)<br/>- usuario_nome (String))
        
        C_Usuarios -- UID --> D_Usuario
        D_Usuario --- D_Usuario_Data

        C_Produtos -- ID Auto --> D_Produto
        D_Produto --- D_Produto_Data
        
        C_Movimentacoes -- ID Auto --> D_Movimentacao
        D_Movimentacao --- D_Movimentacao_Data
    end

    Auth -- Gera UID --> C_Usuarios
    D_Movimentacao_Data -- Ref a --> D_Usuario
    D_Movimentacao_Data -- Ref a --> D_Produto

    %% Descrição das Relações %%
    style D_Usuario_Data fill:#f9f,stroke:#333,stroke-width:2px
    style D_Produto_Data fill:#f9f,stroke:#333,stroke-width:2px
    style D_Movimentacao_Data fill:#f9f,stroke:#333,stroke-width:2px