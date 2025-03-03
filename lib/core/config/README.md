# Configuração do Aplicativo

Este diretório contém arquivos de configuração central para o aplicativo.

## AppConfig

O arquivo `app_config.dart` contém configurações globais que podem ser acessadas em todo o projeto. Uma das principais funcionalidades é a gestão do nome do pacote para imports.

### Uso do AppConfig para Imports

Existem duas maneiras de usar o AppConfig para imports:

#### 1. Imports Diretos (Recomendado para a maioria dos casos)

Continue usando imports diretos normalmente:

```dart
import 'package:basic_app/core/utils/constants/app_strings.dart';
```

Quando o nome do pacote precisar ser alterado, use o script de atualização:

```bash
dart tools/update_package_name.dart basic_app new_package_name
```

#### 2. Imports Dinâmicos (Para casos especiais)

Para casos onde você precisa gerar caminhos de import dinamicamente:

```dart
import '${AppConfig.getImportPath('core/utils/constants/app_strings.dart')}';
```

### Vantagens

- **Manutenção Simplificada**: Quando o nome do pacote muda, você só precisa atualizar em um lugar
- **Consistência**: Garante que todos os imports usem o mesmo padrão
- **Automação**: O script de atualização facilita a migração quando necessário

### Exemplo

Veja um exemplo completo em `lib/core/utils/examples/import_example.dart`.
