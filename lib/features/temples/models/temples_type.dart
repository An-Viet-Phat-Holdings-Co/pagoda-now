class Temple {
  final String name;
  final String location;
  final String imageUrl;
  final String description;
  final double distanceKm;
  final int popularity;

  Temple({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.description,
    required this.distanceKm,
    required this.popularity,
  });

  factory Temple.fromMap(Map<String, dynamic> map) {
    return Temple(
      name: map['name'] ?? '',
      location: map['location'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      description: map['description'] ?? '',
      distanceKm: (map['distanceKm'] ?? 0).toDouble(),
      popularity: (map['popularity'] ?? 0).toInt(),
    );
  }
}
