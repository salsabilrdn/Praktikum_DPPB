import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/api_service.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final ApiService apiService;

  UserCubit(this.apiService) : super(UserInitial());

  Future<void> fetchUsers() async {
    emit(UserLoading());
    try {
      final users = await apiService.getUsers();
      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
