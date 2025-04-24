class Comment {
  final String username;
  final String text;
  final String timeAgo;
  final String userImage;
  final int likes;
  final List<Comment> replies;

  Comment({
    required this.username,
    required this.text,
    required this.timeAgo,
    required this.userImage,
    required this.likes,
    this.replies = const [],
  });
}
