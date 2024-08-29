import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/post.dart';

sealed class RemotePostState extends Equatable {
  final List<PostEntity>? posts;
  final DioException? error;

  const RemotePostState({this.posts, this.error});

  @override
  List<Object> get props => [posts!, error!];
}

class RemotePostLoading extends RemotePostState {
  const RemotePostLoading();
}

class RemotePostDone extends RemotePostState {
  const RemotePostDone(List<PostEntity> posts) : super(posts: posts);
}

class RemotePostError extends RemotePostState {
  const RemotePostError(DioException error) : super(error: error);
}
