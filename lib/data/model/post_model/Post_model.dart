import 'package:json_annotation/json_annotation.dart';
part 'Post_model.g.dart';
/// userId : 1
/// id : 1
/// title : "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
/// body : "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"

@JsonSerializable()
class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({
      this.userId, 
      this.id, 
      this.title, 
      this.body,});

  factory PostModel.fromJson(dynamic json) => _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

}