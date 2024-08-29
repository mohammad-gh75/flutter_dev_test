import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/posts_api_service.dart';
import '../models/post.dart';

class PostRepositoryImpl implements PostRepository {
  final PostsApiService _postsApiService;

  PostRepositoryImpl(this._postsApiService);

  @override
  Future<DataState<List<PostModel>>> getPosts() async {
    try {
      final httpResponse = await _postsApiService.getPosts();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          error: DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(error: e);
    }
  }
}
