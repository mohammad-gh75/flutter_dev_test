import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final int? id;
  final int? userId;
  final String? title;
  final String? body;

  const PostEntity({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        title,
        body,
      ];
}
