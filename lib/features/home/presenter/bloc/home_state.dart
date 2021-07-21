part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => null;
}

class HomeCompleteState extends HomeState {
  HomeCompleteState(this.products);
  final List<Product> products;

  @override
  List<Object> get props => [products];

  @override
  bool get stringify => true;
}

class HomeErrorState extends HomeState {
  @override
  List<Object> get props => null;
}

class HomeNotInternetState extends HomeState {
  @override
  List<Object> get props => null;
}
