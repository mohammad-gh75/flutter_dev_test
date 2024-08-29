import 'package:equatable/equatable.dart';

sealed class RemotePostEvent extends Equatable {
  const RemotePostEvent();

  @override
  List<Object> get props => [];
}

class GetPosts extends RemotePostEvent {
  const GetPosts();
}
