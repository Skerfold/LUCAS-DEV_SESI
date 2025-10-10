## Curso Mobile 

- Estudo POO
    - Configuração da Máquina
    - Instalação do Java
    - Olá Mundo (Meu Primeiro Java)
    - Calculadora em JAVA
    - Programa Completo de Controle de Cursos:
        - Classe, 
        - Objetos, 
        - Herança, 
        - Encapsulamento
        - Abstração
        - Interface.
- Introdução ao Flutter
    - Nativo x Multiplataforma
        - Nativo:
            - Android:
                - IDE: Android Studio
                - SDK: Android SDK
                - Linguagens: Kotlin / Java
                - Plaformas: Win / Linux / Mac
            - Ios:
                - IDE: Xcode
                - SDK: Cocoa Touch
                - Linguagnes: Swift / ObjC
                - Plataformas: Mac
        - Multiplataforma:
            - React Native:
                - Linguagem: JavaScript
                - Tipos Soft: Android/Ios/Web
                - Resultado: Nativos()
            - Flutter: 
                - Linguagem: Dart
                - Tipos Soft: Android/Ios/Web/Linux/Win/Mac
                - Resultado: Nativos()
            - Ionic:
                - Linguagem: JavaScript
                - Tipos Soft: Android/Ios/Web
                - Resultado: Emulado(RunTime)

    - Configuração do Ambiente de Desenvolvimento
    - Estrutura de um Aplicativo Flutter
        - Interface Linha de Comando (CLI)
            - flutter create - criar workspaces(projetos)
            "flutter create --empty" - app padrão (Hello World);
            "flutter create --platforms=android" 
                escolher a plataforma de desenvolvimento
        Exemplo de uso:
        flutter create --platforms=android --empty nome_app
        obs: não usar caracteres especiais no nome "ç,ã,â,á"
        
        -flutter run - rodar a aplicação no emulador
            construção do apk
            --verbose
            "flutter run -v"

        - flutter pug get (atualização dos pacotes)

        - flutter upgrade - atualiza a versão do flutter

        - flutter downgrade - volta para uma versão anterior

        --flutter doctor - verifica as disponibilidade de uso
        