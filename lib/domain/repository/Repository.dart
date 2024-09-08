
import 'package:sisterslabsecond/data/model/post_model/Post_model.dart';

import '../../data/model/user_model/UserModel.dart';

abstract class Repository {
  Future<List<UserModel>> getAllUsers();
  Future<List<PostModel>> getAllPosts();
  Future<List<PostModel>> postPost(PostModel post);
}