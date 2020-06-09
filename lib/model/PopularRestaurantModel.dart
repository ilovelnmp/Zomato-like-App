class PopularRestaurant {
  String restaurantName;
  String featuredImg;
  var ratings;
  int reviewCount;
  List<dynamic> establishment;
  String cuisines;
  String lat;
  String long;
  String location;
  String address;
  int costForTwo;
  int distanceAway = 0;
  String timing;
  String phoneNumber;
  List<dynamic> highlights;
  var restID;

  PopularRestaurant(
      {this.long,
      this.lat,
      this.featuredImg,
      this.restaurantName,
      this.location,
      this.address,
      this.cuisines,
      this.costForTwo,
      this.establishment,
      this.ratings,
      this.reviewCount,
      this.timing,
      this.phoneNumber,
      this.highlights,
      this.restID,
      this.distanceAway = 0});

  factory PopularRestaurant.fromJson(Map<String, dynamic> json) {
    return PopularRestaurant(
      restaurantName: json['restaurant']['name'] as String,
      featuredImg: json['restaurant']['featured_image'] as String,
      ratings: json['restaurant']['user_rating']['aggregate_rating'],
      reviewCount: json['restaurant']['all_reviews_count'] as int,
      establishment: json['restaurant']['establishment'] as List<dynamic>,
      cuisines: json['restaurant']['cuisines'] as String,
      lat: json['restaurant']['location']['latitude'] as String,
      long: json['restaurant']['location']['longitude'] as String,
      location: json['restaurant']['location']['locality_verbose'] as String,
      address: json['restaurant']['location']['address'] as String,
      costForTwo: json['restaurant']['average_cost_for_two'] as int,
      timing: json['restaurant']['timings'] as String,
      phoneNumber: json['restaurant']['phone_numbers'] as String,
      highlights: json['restaurant']['highlights'] as List<dynamic>,
      restID: json['restaurant']['id'],
    );
  }
}
