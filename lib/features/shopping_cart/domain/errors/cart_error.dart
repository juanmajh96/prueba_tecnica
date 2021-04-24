class CartError implements Exception {}

class DataSourceError implements CartError {
  DataSourceError({this.messageError});
  final String messageError;
}

class NotConnection implements CartError {}

class DefaultError implements CartError {
  DefaultError({this.messageError});
  final String messageError;
}
