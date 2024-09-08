import 'package:sisterslabsecond/data/datasource/network/ApiClient.dart';
import 'package:sisterslabsecond/data/model/post_model/Post_model.dart';

import '../../domain/repository/Repository.dart';
import '../model/user_model/UserModel.dart';

class RepositoryImpl implements Repository {
  final ApiClient _apiClient;

  RepositoryImpl(this._apiClient);

  @override
  Future<List<UserModel>> getAllUsers() {
    return _apiClient.getUsersFromApi();
  }

  @override
  Future<List<PostModel>> getAllPosts() {
    return _apiClient.getPostsFromApi();
  }

  @override
  Future<List<PostModel>> postPost(PostModel post) {
    return _apiClient.postPostToApi(post);
  }


}