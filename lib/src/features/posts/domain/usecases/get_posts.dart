import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';

class GetPostsUseCase implements UseCase<DataState<List<PostEntity>>, void> {
  final PostRepository _postRepository;

  GetPostsUseCase(this._postRepository);

  @override
  Future<DataState<List<PostEntity>>> call({void params}) async {
    return await _postRepository.getPosts();
  }
}
