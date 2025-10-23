# Entrega 8: Descritivo de Teste de Software

Este documento descreve as ferramentas, ambiente e casos de teste (CT) para validar os requisitos funcionais do Sistema de Gestão de Almoxarifado (SGA).

## 8.1. Ferramentas e Ambiente

### Ferramentas de Teste

1.  **Flutter Driver (`integration_test`):** Para testes de integração e End-to-End (E2E), simulando a jornada completa do usuário (login -> cadastro -> logout).
2.  **Flutter Test (`flutter_test`):** Para testes de widgets, validando se cada tela (Login, Principal) reage corretamente a interações (cliques, digitação) de forma isolada.
3.  **Test (`test`):** Para testes unitários, validando lógicas puras (ex: o método `Produto.toMap()` e `Produto.fromMap()`).
4.  **Firebase Emulators (Local Emulator Suite):** Ferramenta **essencial** para os testes. Permite rodar uma versão local do Firebase (Auth e Firestore) para que os testes automáticos não poluam o banco de dados de produção/desenvolvimento.

### Ambiente de Teste

* **Sistema Operacional:** Windows 11 / macOS (com Flutter SDK instalado).
* **Dispositivos:** Emulador Android (Pixel 7 API 33) e Google Chrome (para a versão Web).
* **Banco de Dados:** Instância local do Firebase Emulator (Firestore e Auth).
* **Condição Inicial:** O Emulador do Firestore deve ser iniciado limpo (sem dados) antes de cada suíte de testes.

## 8.2. Casos de Teste por Requisito Funcional

Abaixo estão os casos de teste críticos para cada requisito funcional (RF).

---

### Módulo: Autenticação (RF001, RF002, RF004)

* **CT01: Login com Sucesso**
    * **RF:** RF001
    * **Passos:** 1. Abrir o app. 2. Digitar um e-mail válido (ex: `admin@sga.com`) e senha correta (`senha123`) cadastrados no Firebase Auth. 3. Clicar em "ENTRAR".
    * **Resultado Esperado:** O indicador de "carregando" aparece e, em seguida, o usuário é redirecionado para a tela `/principal`.

* **CT02: Login com Senha Incorreta**
    * **RF:** RF002, 4.1
    * **Passos:** 1. Abrir o app. 2. Digitar um e-mail válido (ex: `admin@sga.com`) e uma senha incorreta (ex: `errada`). 3. Clicar em "ENTRAR".
    * **Resultado Esperado:** Um diálogo de alerta é exibido com a mensagem "Senha incorreta." (ou similar do FirebaseAuth).

* **CT03: Login com E-mail Inexistente**
    * **RF:** RF002, 4.1
    * **Passos:** 1. Abrir o app. 2. Digitar um e-mail não cadastrado (ex: `naoexiste@sga.com`) e qualquer senha. 3. Clicar em "ENTRAR".
    * **Resultado Esperado:** Um diálogo de alerta é exibido com a mensagem "Nenhum usuário encontrado com este e-mail." (ou similar).

* **CT04: Login com Campos Vazios (Validação)**
    * **RF:** RF011 (Implícito no Login)
    * **Passos:** 1. Abrir o app. 2. Deixar os campos "E-mail" e "Senha" vazios. 3. Clicar em "ENTRAR".
    * **Resultado Esperado:** A navegação não ocorre. Mensagens de validação (ex: "Por favor, informe o e-mail.") aparecem abaixo dos campos.

* **CT05: Logout e Segurança da Rota**
    * **RF:** RF004, 5.1.2
    * **Passos:** 1. Estar logado na tela `/principal`. 2. Clicar no ícone "Logout". 3. Ser redirecionado para a tela `/login`. 4. Pressionar o botão "Voltar" do navegador ou celular.
    * **Resultado Esperado:** O usuário permanece na tela `/login` e não consegue "voltar" para a tela `/principal`.

---

### Módulo: Cadastro de Produto (RF005, RF006, RF007, RF010, RF011)

* **CT06: Adicionar Novo Produto (CRUD - Create)**
    * **RF:** RF005, 6.1.3
    * **Passos:** 1. Ir para a tela "Cadastro de Produto". 2. Clicar no botão `+` (FAB). 3. Preencher todos os campos obrigatórios. 4. Clicar em "Salvar".
    * **Resultado Esperado:** O diálogo fecha. O novo produto aparece imediatamente na lista (tabela) e um novo documento é criado na coleção `Produtos` no Firestore.

* **CT07: Validação de Formulário de Produto (CRUD - Validation)**
    * **RF:** RF011, 6.1.6
    * **Passos:** 1. Ir para "Cadastro de Produto". 2. Clicar no botão `+`. 3. Deixar o campo "Nome" vazio. 4. Clicar em "Salvar".
    * **Resultado Esperado:** O diálogo não fecha. Uma mensagem de erro (ex: "Campo obrigatório") aparece abaixo do campo "Nome".

* **CT08: Editar Produto (CRUD - Update)**
    * **RF:** RF006, 6.1.4
    * **Passos:** 1. Ir para "Cadastro de Produto". 2. Clicar no ícone "Editar" (lápis) de um produto existente. 3. Alterar o campo "Nome" (ex: de "Martelo" para "Martelo 2.0"). 4. Clicar em "Salvar".
    * **Resultado Esperado:** O diálogo fecha. O nome do produto na lista é atualizado para "Martelo 2.0".

* **CT09: Excluir Produto (CRUD - Delete)**
    * **RF:** RF007, 6.1.5
    * **Passos:** 1. Ir para "Cadastro de Produto". 2. Clicar no ícone "Excluir" (lixeira) de um produto. 3. Confirmar a exclusão no diálogo de alerta.
    * **Resultado Esperado:** O diálogo fecha. O produto desaparece da lista.

* **CT10: Filtro de Busca (Real-time)**
    * **RF:** RF010, 6.1.2
    * **Passos:** 1. Garantir que a lista tenha "Martelo Unha" e "Chave de Fenda". 2. Digitar "Martelo" no campo de busca.
    * **Resultado Esperado:** A lista se atualiza automaticamente, mostrando apenas "Martelo Unha" e escondendo "Chave de Fenda".

---

### Módulo: Gestão de Estoque (RF014, RF015, RF016, RF018, RFs de Rastreabilidade)

* **CT11: Registrar Movimentação de Entrada**
    * **RF:** RF015, 7.1.1
    * **Passos:** 1. Ir para "Gestão de Estoque". 2. Selecionar um produto (Estoque atual: 50). 3. Selecionar "Entrada". 4. Digitar "10" no campo Quantidade. 5. Clicar em "SALVAR".
    * **Resultado Esperado:** O `estoque_atual` do produto no Firestore é atualizado para 60 (via `FieldValue.increment`). Um novo documento é criado na coleção `Movimentacoes` com `tipo: "Entrada"`, `quantidade: 10`.

* **CT12: Registrar Movimentação de Saída (com Alerta)**
    * **RF:** RF016, RF018, 7.1.4
    * **Passos:** 1. Ir para "Gestão de Estoque". 2. Selecionar um produto (Estoque atual: 15, Estoque mínimo: 10). 3. Selecionar "Saída". 4. Digitar "6" no campo Quantidade (Novo estoque será 9, abaixo do mínimo 10). 5. Clicar em "SALVAR".
    * **Resultado Esperado:** 1. Um diálogo de "Atenção: Estoque Baixo" é exibido. 2. O usuário clica em "OK, Entendido". 3. O estoque é atualizado para 9. 4. Um log de `tipo: "Saída"` é criado.

* **CT13: Bloqueio de Estoque Negativo**
    * **RF:** RF016, 7.1.4 (Implícito)
    * **Passos:** 1. Ir para "Gestão de Estoque". 2. Selecionar um produto (Estoque atual: 5). 3. Selecionar "Saída". 4. Digitar "6" no campo Quantidade. 5. Clicar em "SALVAR".
    * **Resultado Esperado:** Uma mensagem de erro (Snackbar) é exibida (ex: "Estoque insuficiente..."). O `estoque_atual` no Firestore *permanece* 5. Nenhum log de movimentação é criado.