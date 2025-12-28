import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/api_service.dart';
import 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final ApiService apiService;

  PostCubit(this.apiService) : super(PostInitial());

  Future<void> fetchPosts() async {
    emit(PostLoading());
    try {
      final posts = await apiService.getPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }

  Future<void> fetchPostsByUserId(int userId) async {
    emit(PostLoading());
    try {
      final posts = await apiService.getPostsByUserId(userId);
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }
}
