import 'dart:convert';

List<Post> postListFromJson(String str) {
  List list = jsonDecode(str);
  List<Post> listPost = list.map((item) => Post.fromJson(item)).toList();
  return listPost;
}
String postListToJson(List<Post> data) => jsonEncode(data.map((e) => e.toJson()).toList());


Post postFromJson(String str) => Post.fromJson(json.decode(str));
String postToJson(Post data) => json.encode(data.toJson());
class Post {
  Post({
      this.userId, 
      this.id, 
      this.title, 
      this.body,});

  Post.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
  int? userId;
  int? id;
  String? title;
  String? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    return map;
  }

}