import 'package:bloc/bloc.dart';

class HeroTagCubit extends Cubit<String> {
  HeroTagCubit() : super('');

  void changeHeroTag(String heroTag) {
    emit(heroTag);
  }
}
