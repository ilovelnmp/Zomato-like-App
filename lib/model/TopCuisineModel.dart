class TopCuisines {
  final List<dynamic> topCuisinesNearby;

  TopCuisines({this.topCuisinesNearby});

  factory TopCuisines.fromJson(Map<String, dynamic> json) {
    return TopCuisines(
      topCuisinesNearby: json['popularity']['top_cuisines'] as List<dynamic>,
    );
  }
}
