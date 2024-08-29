import 'package:dio/dio.dart';

import '../../../config/injector/injector_conf.dart';
import '../data/datasources/posts_api_service.dart';
import '../data/repositories/post_repository_impl.dart';
import '../domain/repositories/post_repository.dart';
import '../domain/usecases/get_posts.dart';
import '../presentation/bloc/post/remote/remote_post_bloc.dart';

class PostsDependency {
  PostsDependency._();

  static void init() {
    getIt.registerLazySingleton<PostsApiService>(() => PostsApiService(
          getIt<Dio>(),
        ));

    getIt.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(
          getIt<PostsApiService>(),
        ));

    getIt.registerLazySingleton<GetPostsUseCase>(() => GetPostsUseCase(
          getIt<PostRepository>(),
        ));

    getIt.registerFactory<RemotePostBloc>(() => RemotePostBloc(
          getIt<GetPostsUseCase>(),
        ));
  }
}
