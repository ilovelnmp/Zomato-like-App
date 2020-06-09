import 'package:rxdart/rxdart.dart';
import 'package:zomatodummyapp/Repository/Repository.dart';
import 'package:zomatodummyapp/model/PopularRestaurantModel.dart';

class PopularNearbyRestaurantBloc {
  Repository _repository = Repository();

  final _popularNearbyRestaurantFetcher =
      PublishSubject<List<PopularRestaurant>>();

  Observable<List<PopularRestaurant>> get popularNearbyRestaurant =>
      _popularNearbyRestaurantFetcher.stream;

  fetchPopularNearbyRestaurant() async {
    List<PopularRestaurant> popularNearbyRestaurantResponse =
        await _repository.fetchPopularNearbyRestaurant();
    _popularNearbyRestaurantFetcher.sink.add(popularNearbyRestaurantResponse);
  }

  dispose() {
    _popularNearbyRestaurantFetcher.close();
  }
}

final popularNearbyRestaurantBloc = PopularNearbyRestaurantBloc();
