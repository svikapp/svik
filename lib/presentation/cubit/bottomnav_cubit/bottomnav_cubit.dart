import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottomnav_state.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  void updateBottomNav(int index){
    emit(index);
  }
}
