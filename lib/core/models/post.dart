import 'dart:convert';

String postsToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

List<Post> postsFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

List<Post> postsFromUserJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromUserJson(x)));

class Post{
  final int? userId;
  final int? postId;
  final String? title;
  final String? description;
  final isVisible;
  var books;
  final String? postAuthor;
  final String? authorAvatar;
  final String? lat;
  final String? long;

  Post( {
    required this.userId,
    required this.postId,
    required this.title,
    required this.description,
    required this.isVisible,
    required this.postAuthor,
    required this.authorAvatar,
    required this.lat,
    required this.long,
    this.books
  });


  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['user']['id'],
        postId: json['id'],
        title: json['title'],
        description: json['description'],
        postAuthor: json['user']['name'],
        authorAvatar: json['user']['user_picture'],
        lat: json['localisation']['lat'],
        long: json['localisation']['lng'],
        books: json['books'],
        isVisible: json['is_visible']
    );
  }

  factory Post.fromUserJson(Map<String, dynamic> json) {
    print("json $json");
    return Post(
        userId: 0,
        postId: json['id'],
        title: json['title'],
        description: json['description'],
        postAuthor: json['name'],
        authorAvatar: "",
        lat: json['localisation']['lat'],
        long: json['localisation']['lng'],
        books: json['books'],
        isVisible: json['is_visible']
    );
  }

  static final empty = Post(
      userId: 0,
      postId: 0,
      title: "",
      description: "",
      postAuthor: "",
      lat: '0.0',
      long: '0.0',
      books: [],
      isVisible: 0, authorAvatar: ''
  );

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'postId': postId,
      'title': title,
      'description': description,
      'postAuthor': postAuthor,
      'authorAvatar': authorAvatar,
      'books': books,
      'lat': lat,
      "lng" : long
    };
  }



}