class HomeError implements Exception {}

class DataSourceError implements HomeError {
  DataSourceError({this.messageError});
  final String messageError;
}

class NotConnection implements HomeError {}

class DefaultError implements HomeError {
  DefaultError({this.messageError});
  final String messageError;
}
