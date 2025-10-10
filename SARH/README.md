# Sa_ProjetoRH

- Por Lucas, Rafael, Miguel

## SITE PORTAL RH - 

#Limeira, SP 


### DOCUMENTAÇÃO ATIV - DIOGO

------------------------------------------------------- 

1. Introdução 
1.1 Propósito do Documento de Requisitos

2. Descrição do Produto 
2.1 Situação atual
2.2 Escopo 

3. Requisitos 
3.1 Requisitos Funcionais
3.2 Requisitos não Funcionais

4. Regras de Projeto 
4.1 Diagrama de Classe 
4.2 Diagrama de Fluxo
4.3 Diagramas de Casos e Usos 

5. Modelo de Alta Fidelidade 

-------------------------------------------------------

HISTÓRICO DE REVISÃO DE DOCUMENTO 

Versão |    Data    |   Autor   |   Descrição



1.0    |    15/08   |   Lucas   | Criação de documento

2.0    |    22/08   |   Lucas   | Finalização do Doc.

---------------------------------------------------------

1 INTRODUÇÃO 

Documentação com o proposito de recolher as informações sobre a pesquisa da atividade avaliativa do Diogo. 

#  Documentação – Plataforma RH  

##  Escopo  
O projeto **Plataforma RH** tem como objetivo desenvolver uma aplicação **Angular** com back-end simulado via **json-server**, permitindo:  
- Cadastro e login de usuários comuns.  
- Envio de currículos pelos usuários.  
- Login de administradores, com permissão para **CRUD** de vagas.  
- Listagem pública de vagas.  
- Restrições de acesso baseadas no tipo de usuário (admin ou comum).  

O sistema será entregue como uma **SPA (Single Page Application)** responsiva para desktop e mobile.  

---

##  Objetivos SMART  
- **S** (Específico): Criar um sistema de recrutamento com autenticação, autorização e gestão de vagas/currículos.  
- **M** (Mensurável): Disponibilizar pelo menos **3 perfis de teste (1 admin, 2 usuários)** e garantir funcionamento dos fluxos de cadastro, login e CRUD de vagas.  
- **A** (Alcançável): Usar Angular 16+, Reactive Forms e json-server, tecnologias acessíveis à equipe.  
- **R** (Relevante): Simular de forma realista um sistema interno de RH que atenda candidatos e administradores.  
- **T** (Temporal): Concluir a aplicação em até **2 semanas**.  

---

##  Levantamento de Requisitos  

### Recursos Humanos  
- **Equipe de Desenvolvimento Angular** (Front-end e simulação de Back-end)  
- **Designer UI/UX** (protótipos no Figma)  
- **Documentador** (levantamento de requisitos e diagramas)  
- **Cliente fictício: RH Connect**  

### Ferramentas de Desenvolvimento  
- **Front-end:** Angular 16+, SCSS customizado  
- **Back-end simulado:** json-server  
- **Armazenamento de sessão:** LocalStorage  
- **Prototipação e diagramas:** Figma, Draw.io  
- **Controle de versão:** Git e GitHub  

---

##  Cronograma ( 1 semana )  

| Etapa | Atividade | Responsável | Prazo |
|-------|------------|-------------|-------|
| 1 | Levantamento de requisitos e briefing | Equipe | Dia 15 |
| 2 | Protótipos de telas (login, registro, vagas, currículos, admin) | Designer | Dia 22 |
| 3 | Diagramas (fluxo de autenticação, casos de uso, classes) | Documentador | Dia 15 |
| 4 | Configuração do ambiente (Angular + json-server) | Devs | Dia 15 |
| 5 | Implementação de autenticação e autorização (guards) | Devs | Dias 18-22 |
| 6 | CRUD de vagas (Admin) e envio de currículos (Usuário) | Devs | Dias 18-22 |
| 7 | Integração de layout responsivo (SCSS) | Devs + Designer | Dias 22 |
| 8 | Testes internos e ajustes finais | Equipe | Dias 12–13 |
| 9 | Entrega final e gravação da apresentação | Equipe | Dia 22 |

---------------------------------------------------------
