class NearbyRestaurant {
  String restaurantName;
  String thumbnail;
  String featuredImg;
  var restID;
  String cuisines;

  NearbyRestaurant(
      {this.featuredImg,
      this.restaurantName,
      this.thumbnail,
      this.restID,
      this.cuisines});

  factory NearbyRestaurant.fromJson(Map<String, dynamic> json) {
    return NearbyRestaurant(
      restaurantName: json['name'] as String,
      thumbnail: json['thumb'] as String,
      featuredImg: json['featured_image'] as String,
      restID: json['id'],
      cuisines: json['cuisines'] as String,
    );
  }
}
