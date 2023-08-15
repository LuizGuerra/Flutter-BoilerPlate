class AppStrings {
  /*  ===============
  *   Other Strings
  *   =============== */
  static String seeMore = "Ver mais";
  static String loading = "Carregando";
  static String connect = "Conectar";

  static String helloWorld = "Hello World";

  /*  ===============
  *   App Bar Strings
  *   =============== */
  static _AppBar appBar = _AppBar();

  /*  ===============
  *   Bottom Bar Strings
  *   =============== */
  static _BottomBar bottomBar = _BottomBar();

  /*  ===============
  *   Button Strings
  *   =============== */
  static _Button button = _Button();

  /*  ===============
  *   Icon Image Name
  *   =============== */
  static _Images images = _Images();

  /*  ===============
  *   External URLs
  *   =============== */
  static _ExternalURL externalURL = _ExternalURL();

  /*  ===============
  *   Error Messages
  *   =============== */
  static _Error error = _Error();

  /*  ===============
  *   Input Decoration Placeholder
  *   =============== */
  static _InputPlaceholder placeholders = _InputPlaceholder();

  /*  ===============
  *   Local Storage Keys
  *   =============== */
  static _LocalStorageKeys storageKeys = _LocalStorageKeys();
}

class _AppBar {
  final String back = "Voltar";
  final String filter = 'Filtrar';

  final String home = "Home";

  final String titleExample = "Title Example";
}

class _BottomBar {
  final String home = "Home";
  final String profile = "Profile";
}

class _Button {
  final String send = "Enviar";
  final String filter = "Filtrar";
}

class _Images {
  final String background = "assets/images/window_background.png";
  final String people = "assets/images/people.png";
}

class _ExternalURL {
  final String google = "https://google.com/";
}

class _InputPlaceholder {
  /// Destination placeholder
  final String destination = "Para: RH";
  /// Title placeholder
  final String title = "Título";
}

class _LocalStorageKeys {
  final String token = "token";
  final String registration = "registration";
}

/// Application error messages
class _Error {
  /// No content available
  final String noContent = "Nenhum conteúdo disponível!";
  /// Generic back to previous page
  final String router = "Erro carregando a página.";
  /// No content available
  final String snapshot = "Erro ao carregar os dados.";
}
