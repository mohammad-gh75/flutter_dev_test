import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../domain/usecases/get_posts.dart';
import 'remote_post_event.dart';
import 'remote_post_state.dart';

class RemotePostBloc extends Bloc<RemotePostEvent, RemotePostState> {
  final GetPostsUseCase _getPostsUseCase;

  RemotePostBloc(this._getPostsUseCase) : super(const RemotePostLoading()) {
    on<GetPosts>(onGetPosts);
  }

  Future<void> onGetPosts(GetPosts event, Emitter<RemotePostState> emit) async {
    final dataState = await _getPostsUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemotePostDone(dataState.data!));
    } else if (dataState is DataFailed) {
      debugPrint(dataState.error!.message);
      emit(RemotePostError(dataState.error!));
    }
  }
}
