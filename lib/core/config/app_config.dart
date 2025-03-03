// Arquivo de configuração central para o aplicativo
// Contém constantes e configurações que podem ser reutilizadas em todo o projeto

class AppConfig {
  // Nome do pacote usado nos imports
  // Altere apenas este valor quando o nome do pacote mudar no pubspec.yaml
  static const String packageName = 'todo_hive';
  
  // Método auxiliar para gerar o caminho completo do import
  static String getImportPath(String relativePath) {
    return 'package:$packageName/$relativePath';
  }
}
