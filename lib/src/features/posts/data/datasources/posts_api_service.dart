import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/constants.dart';
import '../models/post.dart';

part 'posts_api_service.g.dart';

@RestApi(baseUrl: postAPIBaseURL)
abstract class PostsApiService {
  factory PostsApiService(Dio dio) = _PostsApiService;

  @GET('/posts')
  Future<HttpResponse<List<PostModel>>> getPosts();
}
