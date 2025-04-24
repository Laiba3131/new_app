class Story {
  final String id;
  final String username;
  final String imageUrl;
  final String timeAgo;
  final bool isViewed;
  final bool isOwn;

  Story({
    required this.id,
    required this.username,
    required this.imageUrl,
    required this.timeAgo,
    this.isViewed = false,
    this.isOwn = false,
  });
}

class StoryUser {
  final String username;
  final String imageUrl;
  final List<Story> stories;
  final bool hasUnviewedStories;

  StoryUser({
    required this.username,
    required this.imageUrl,
    required this.stories,
    this.hasUnviewedStories = true,
  });
}
