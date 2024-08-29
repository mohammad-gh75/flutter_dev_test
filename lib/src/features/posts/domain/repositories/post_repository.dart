import '../../../../core/resources/data_state.dart';
import '../entities/post.dart';

abstract class PostRepository {
  Future<DataState<List<PostEntity>>> getPosts();
}
