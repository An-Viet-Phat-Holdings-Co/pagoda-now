class CommunityPost {
  final String title;
  final String author;
  final String content;
  final String? imageUrl;
  final String? date;

  CommunityPost({
    required this.title,
    required this.author,
    required this.content,
    this.imageUrl,
    this.date,
  });
}
