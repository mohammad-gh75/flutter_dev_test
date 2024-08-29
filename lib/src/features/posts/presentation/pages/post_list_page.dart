import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/src/features/posts/domain/entities/post.dart';

import '../../../../config/injector/injector_conf.dart';
import '../bloc/post/remote/remote_post_bloc.dart';
import '../bloc/post/remote/remote_post_event.dart';
import '../bloc/post/remote/remote_post_state.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemotePostBloc>(
      create: (context) => getIt<RemotePostBloc>()..add(const GetPosts()),
      child: Scaffold(
        appBar: _buildAppbar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      title: const Text(
        'Post list',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<RemotePostBloc, RemotePostState>(
      builder: (_, state) {
        if (state is RemotePostLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is RemotePostError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        } else if (state is RemotePostDone) {
          return ListView.separated(
            itemCount: state.posts?.length ?? 0,
            padding: const EdgeInsetsDirectional.all(16),
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemBuilder: (context, index) {
              return _postListItem(state.posts![index]);
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _postListItem(PostEntity post) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        children: [
          _listItemRow('id', post.id.toString()),
          const Divider(
            color: Colors.grey,
            thickness: 0.5,
            height: 0,
          ),
          _listItemRow('userId', post.userId.toString()),
          const Divider(
            color: Colors.grey,
            thickness: 0.5,
            height: 0,
          ),
          _listItemRow('title', post.title),
          const Divider(
            color: Colors.grey,
            thickness: 0.5,
            height: 0,
          ),
          _listItemRow('body', post.body),
        ],
      ),
    );
  }

  Widget _listItemRow(String title, String? value) {
    return Container(
      // height: 40,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 70,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                height: 20 / 12,
              ),
              textScaler: TextScaler.noScaling,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                value ?? '',
                style: const TextStyle(
                  fontSize: 12,
                  height: 20 / 12,
                ),
                textScaler: TextScaler.noScaling,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
