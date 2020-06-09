class IndividualRestaurantDetail {
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

  IndividualRestaurantDetail(
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
      this.distanceAway = 0});

  factory IndividualRestaurantDetail.fromJson(Map<String, dynamic> json) {
    return IndividualRestaurantDetail(
      restaurantName: json['name'] as String,
      featuredImg: json['featured_image'] as String,
      ratings: json['user_rating']['aggregate_rating'],
      reviewCount: json['all_reviews_count'] as int,
      establishment: json['establishment'] as List<dynamic>,
      cuisines: json['cuisines'] as String,
      lat: json['location']['latitude'] as String,
      long: json['location']['longitude'] as String,
      location: json['location']['locality_verbose'] as String,
      address: json['location']['address'] as String,
      costForTwo: json['average_cost_for_two'] as int,
      timing: json['timings'] as String,
      phoneNumber: json['phone_numbers'] as String,
      highlights: json['highlights'] as List<dynamic>,
    );
  }
}
