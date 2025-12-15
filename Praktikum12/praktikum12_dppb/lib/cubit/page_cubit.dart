import 'package:flutter_bloc/flutter_bloc.dart';

class PageCubit extends Cubit<int> {
  PageCubit() : super(0); // default di Home (index 0)

  void changePage(int index) {
    emit(index);
  }
}
