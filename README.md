# windsurf_test

Um aplicativo Flutter com estrutura modular e configuração flexível.

## Getting Started

Este projeto é um ponto de partida para uma aplicação Flutter.

### Recursos e documentação

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Documentação online](https://docs.flutter.dev/), que oferece tutoriais, exemplos e referência completa da API.

## Funcionalidades Especiais

### Mudança de Nome do Pacote

Este projeto inclui ferramentas para facilitar a mudança do nome do pacote quando necessário:

1. **Arquivo de Configuração Central**: O arquivo `lib/core/config/app_config.dart` contém uma constante `packageName` que define o nome do pacote usado em todos os imports.

2. **Script de Atualização Automática**: Quando você precisar mudar o nome do pacote:
   - Primeiro, atualize o nome no arquivo `pubspec.yaml`
   - Execute o script de atualização:
   ```bash
   dart tools/update_package_name.dart windsurf_test seu_novo_nome
   ```

Para mais detalhes, consulte o [README das ferramentas](tools/README.md).

## Estrutura do Projeto

O projeto segue a arquitetura MVVM (Model-View-ViewModel) recomendada pelo time do Flutter, com separação clara de responsabilidades:

- `lib/core/` - Componentes centrais e compartilhados
- `lib/features/` - Módulos de funcionalidades específicas
- `lib/core/config/` - Configurações centralizadas do aplicativo
# todo_hive
