class OrdersErrors implements Exception {}

class DataSourceError implements OrdersErrors {
  DataSourceError({this.messageError});
  final String messageError;
}

class NotConnection implements OrdersErrors {}

class DefaultError implements OrdersErrors {
  DefaultError({this.messageError});
  final String messageError;
}
