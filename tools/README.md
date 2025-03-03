# Ferramentas de Desenvolvimento

Este diretório contém scripts e ferramentas úteis para o desenvolvimento do projeto.

## Scripts Disponíveis

### `update_package_name.dart`

Este script automatiza a atualização do nome do pacote em todos os arquivos do projeto quando você precisa alterar o nome no `pubspec.yaml`.

#### Como usar:

1. Primeiro, atualize o nome do pacote no arquivo `pubspec.yaml`
2. Execute o script com o nome antigo e o novo nome do pacote:

```bash
dart tools/update_package_name.dart old_package_name new_package_name
```

Por exemplo:

```bash
dart tools/update_package_name.dart basic_app my_new_app
```

#### O que o script faz:

1. Atualiza a constante `packageName` no arquivo `lib/core/config/app_config.dart`
2. Procura e substitui todos os imports `package:old_package_name/` por `package:new_package_name/` em todos os arquivos `.dart` do projeto

#### Observações:

- Certifique-se de fazer um commit antes de executar o script para poder reverter facilmente se necessário
- O script não atualiza referências ao nome do pacote em outros arquivos além dos `.dart`, como arquivos de configuração ou documentação
