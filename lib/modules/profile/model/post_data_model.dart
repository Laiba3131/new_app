class PostData {
  final String username;
  final String timeAgo;
  final String content;
  final List<String> hashtags;
  final int likes;
  final int comments;
  final int retweets;

  PostData({
    required this.username,
    required this.timeAgo,
    required this.content,
    required this.hashtags,
    required this.likes,
    required this.comments,
    required this.retweets,
  });
}
