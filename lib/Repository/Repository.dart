import 'package:zomatodummyapp/model/IndividualRestaurantDetails.dart';
import 'package:zomatodummyapp/services/logic.dart';
import 'package:zomatodummyapp/model/NearbyRestaurantModel.dart';
import 'package:zomatodummyapp/model/PopularRestaurantModel.dart';

class Repository {
  Logic logic = Logic();

  Future<List<dynamic>> fetchTopCuisines() => logic.fetchTopCuisinesData();
  Future<List<NearbyRestaurant>> fetchNearbyRestaurant() =>
      logic.fetchNearbyRestaurantData();
  Future<List<PopularRestaurant>> fetchPopularNearbyRestaurant() =>
      logic.PopularNeabyRestaurantData();
  Future<IndividualRestaurantDetail> fetchIndividualRestaurantDetail(
          String resID) =>
      logic.fetchIndividualRestaurantDetail(resID);
}
