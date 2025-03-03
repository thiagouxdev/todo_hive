import 'dart:io';

/// Script para atualizar automaticamente todos os imports quando o nome do pacote mudar
/// 
/// Uso: dart tools/update_package_name.dart old_package_name new_package_name
/// Exemplo: dart tools/update_package_name.dart basic_app my_new_app
///
/// Este script irá:
/// 1. Atualizar a constante packageName no arquivo app_config.dart
/// 2. Atualizar todos os imports nos arquivos .dart do projeto

void main(List<String> args) async {
  if (args.length != 2) {
    print('Uso: dart tools/update_package_name.dart old_package_name new_package_name');
    exit(1);
  }

  final oldPackageName = args[0];
  final newPackageName = args[1];

  print('Atualizando nome do pacote de "$oldPackageName" para "$newPackageName"...');

  // Atualizar o arquivo de configuração
  final configPath = 'lib/core/config/app_config.dart';
  try {
    final configFile = File(configPath);
    if (await configFile.exists()) {
      String content = await configFile.readAsString();
      content = content.replaceAll(
          "static const String packageName = '$oldPackageName';",
          "static const String packageName = '$newPackageName';");
      await configFile.writeAsString(content);
      print('✅ Arquivo de configuração atualizado: $configPath');
    } else {
      print('❌ Arquivo de configuração não encontrado: $configPath');
    }
  } catch (e) {
    print('❌ Erro ao atualizar arquivo de configuração: $e');
  }

  // Atualizar todos os imports nos arquivos .dart
  int filesUpdated = 0;
  int importsUpdated = 0;

  try {
    final libDir = Directory('lib');
    await for (final entity in libDir.list(recursive: true)) {
      if (entity is File && entity.path.endsWith('.dart')) {
        final file = File(entity.path);
        String content = await file.readAsString();
        
        final oldImportPattern = "import 'package:$oldPackageName/";
        final newImportPattern = "import 'package:$newPackageName/";
        
        if (content.contains(oldImportPattern)) {
          final originalContent = content;
          content = content.replaceAll(oldImportPattern, newImportPattern);
          
          // Contar quantos imports foram atualizados neste arquivo
          final importCount = '\n'.allMatches(originalContent).length - 
                              '\n'.allMatches(content.replaceAll(oldImportPattern, '')).length;
          
          await file.writeAsString(content);
          filesUpdated++;
          importsUpdated += importCount;
          
          print('✅ Arquivo atualizado: ${entity.path} ($importCount imports)');
        }
      }
    }
    
    print('\n📊 Resumo:');
    print('- Arquivos atualizados: $filesUpdated');
    print('- Imports atualizados: $importsUpdated');
    print('\n✨ Atualização concluída com sucesso!');
    
  } catch (e) {
    print('❌ Erro ao atualizar imports: $e');
  }
}
