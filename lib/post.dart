class Post {
  final String content;
  final String likes;
  final String id;
  final String userId;
  final String name;

  Post({
    required this.content,
    required this.likes,
    required this.id,
    required this.name,
    required this.userId,
  });

  Map<String, dynamic> toJson() => {
        'content': content,
        'likes': likes,
        'post_id': id,
        'un': name,
        'userID': userId,
      };

  static Post fromJson(Map<String, dynamic> json) => Post(
        content: json['content'],
        likes: json['likes'].toString(),
        id: json['post_id'],
        name: json['un'],
        userId: json['userID'],
      );
}
