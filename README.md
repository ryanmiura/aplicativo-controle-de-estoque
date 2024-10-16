# Controle de Estoque NUSELON

Este é um aplicativo de controle de estoque desenvolvido com Flutter para a NUSELON.

## Descrição

O Controle de Estoque NUSELON é um aplicativo móvel projetado para gerenciar eficientemente o inventário de produtos. Ele permite aos usuários adicionar, visualizar, atualizar e remover itens do estoque, fornecendo uma interface intuitiva e fácil de usar.

## Funcionalidades

- Adicionar novos itens ao estoque
- Visualizar lista de itens em estoque
- Atualizar informações de itens existentes
- Remover itens do estoque
- Integração com Firebase para armazenamento em nuvem

## Tecnologias Utilizadas

- Flutter
- Dart
- Firebase (Firestore)

## Configuração do Projeto

1. Clone este repositório
2. Certifique-se de ter o Flutter instalado em sua máquina
3. Execute `flutter pub get` para instalar as dependências
4. Configure o Firebase em seu projeto:
   - Crie um novo projeto no [Firebase Console](https://console.firebase.google.com/)
   - Adicione um aplicativo Android e/ou iOS ao seu projeto Firebase
   - Baixe o arquivo de configuração do Firebase (google-services.json para Android ou GoogleService-Info.plist para iOS)
   - Coloque o arquivo de configuração no diretório apropriado do seu projeto Flutter
   - Copie o arquivo `lib/firebase_options_example.dart` para `lib/firebase_options.dart`
   - Preencha `lib/firebase_options.dart` com as informações do seu projeto Firebase
5. Execute o aplicativo com `flutter run`

## Segurança

Por razões de segurança, o arquivo `lib/firebase_options.dart` está incluído no .gitignore. Certifique-se de nunca compartilhar ou commitar este arquivo, pois ele contém informações sensíveis do seu projeto Firebase.

## Contribuição

Contribuições são bem-vindas! Por favor, sinta-se à vontade para submeter pull requests ou abrir issues para melhorias ou correções de bugs.

## Licença

Este projeto está licenciado sob a [Licença MIT](LICENSE).
