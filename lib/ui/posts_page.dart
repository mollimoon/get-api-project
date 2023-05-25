import 'package:untitled2/data/modals/posts.dart';
import 'package:untitled2/data/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/ui/drawer_bar.dart';
import 'package:untitled2/ui/post_widget.dart';

import '../data/modals/avatar_photo.dart';

import '../data/routes.dart';




class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {

  final _userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return DrawerAppBar(
      child: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: FutureBuilder<List<Post>>(
            future: _userRepository.getPosts(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                final items = snapshot.data as List<Post>;
                return ListView.separated(
                  itemCount: items.length,
                  itemBuilder: (_, index) {
                    return PostWidget(post: items[index]);
                  },
                  separatorBuilder: (_, int index) {
                    return const SizedBox(height: 8);
                  },
                );
              }

              return const Center(child: CircularProgressIndicator()); //spinner
            }),
      ),
    );
  }
}
