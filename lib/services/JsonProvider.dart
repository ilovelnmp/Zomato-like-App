import 'package:zomatodummyapp/model/TopCuisineModel.dart';
import 'package:zomatodummyapp/services/location.dart';
import 'package:zomatodummyapp/services/NetworkHelper.dart';

class JsonProvider {
  final String baseURL = 'https://developers.zomato.com/api/v2.1/';

  Future NearbyRest_TopCuisine_EntityDetailsJsonData() async {
    Location location = Location();
    await location.getCurrentLocation();
    double lat = location.latitude;
    double long = location.longitude;

    var geoCode = 'geocode?lat=$lat&lon=$long';
    var url = '$baseURL$geoCode';
    var response = await NetworkHelper(url).getData();
    //Working
    return response;
  }

  Future BestRestaurantJsonData() async {
    //To Extract EntityType & EntityID
    var geoCodeResponse = await NearbyRest_TopCuisine_EntityDetailsJsonData();
    var entityType = geoCodeResponse['location']['entity_type'];
    var entityID = geoCodeResponse['location']['entity_id'];

    //Use Extracted Entity Type & ID to return JsonData via location_details
    String locationDetail =
        'location_details?entity_id=$entityID&entity_type=$entityType';
    String url = '$baseURL$locationDetail';

    var response = await NetworkHelper(url).getData();

    return response;
  }

  Future IndividualRestaurantJson(String storeID) async {
    var restaurantInfo = 'restaurant?res_id=$storeID';
    var url = '$baseURL$restaurantInfo';

    var response = await NetworkHelper(url).getData();

    return response;
  }
}
