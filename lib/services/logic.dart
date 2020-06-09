import 'package:geolocator/geolocator.dart';
import 'package:zomatodummyapp/model/IndividualRestaurantDetails.dart';
import 'package:zomatodummyapp/model/NearbyRestaurantModel.dart';
import 'package:zomatodummyapp/model/PopularRestaurantModel.dart';
import 'package:zomatodummyapp/model/TopCuisineModel.dart';
import 'package:zomatodummyapp/services/JsonProvider.dart';

class Logic {
  Future<List<dynamic>> fetchTopCuisinesData() async {
    //Will Return a List of Top Cuisines Nearby based on GPS
    final response =
        await JsonProvider().NearbyRest_TopCuisine_EntityDetailsJsonData();
    TopCuisines data = TopCuisines.fromJson(response);

    return data.topCuisinesNearby;
  }

  Future<List<NearbyRestaurant>> fetchNearbyRestaurantData() async {
    //A List to Hold Individual Restaurant's details.
    List<NearbyRestaurant> list = [];

    JsonProvider logic = JsonProvider();
    //Extract NearbyRestaurantID.
    var responseBody =
        await logic.NearbyRest_TopCuisine_EntityDetailsJsonData();
    //Put it in a List to iterate through a 'for' Loop later.
    List nearbyRestaurantID = responseBody['popularity']['nearby_res'];
    //Iterate through the List to extract restaurant ID and run through a
    //function which will return individual Restaurant details.

    for (var i in nearbyRestaurantID) {
      var temp = await logic.IndividualRestaurantJson(i);
      list.add(NearbyRestaurant.fromJson(temp));
    }
    return list;
  }

  Future<List<PopularRestaurant>> PopularNeabyRestaurantData() async {
    //A List to Hold the Popular Restaurant's Details.
    List<PopularRestaurant> list = [];
    var response = await JsonProvider().BestRestaurantJsonData();
    //List of All of the Popular Rated Restaurant which will be
    //Iterated through a 'for' loop later
    List data = response['best_rated_restaurant'];

    //Parsing Json Data into Model and adding it to the List
    for (var i in data) {
      list.add(PopularRestaurant.fromJson(i));
    }

    //Obtain User's Current Latitude and Longitude to check
    //difference in user's and restaurant distance.
    Geolocator geolocator = Geolocator();
    Position currentLocation = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    //Adding DistanceDifference into the distanceAway variable
    for (int i = 0; i < list.length; i++) {
      double distanceDifference = await geolocator.distanceBetween(
          currentLocation.latitude,
          currentLocation.longitude,
          double.parse(list[i].lat),
          double.parse(list[i].long));
      list[i].distanceAway = distanceDifference.round();
    }
    return list;
  }

  Future<IndividualRestaurantDetail> fetchIndividualRestaurantDetail(
      String storeID) async {
    var response = await JsonProvider().IndividualRestaurantJson(storeID);
    IndividualRestaurantDetail data =
        IndividualRestaurantDetail.fromJson(response);
    return data;
  }
}
