import 'package:rxdart/rxdart.dart';
import 'package:zomatodummyapp/Repository/Repository.dart';
import 'package:zomatodummyapp/model/NearbyRestaurantModel.dart';

class NearbyRestaurantBloc {
  Repository _repository = Repository();

  final _nearbyRestaurantFetcher = PublishSubject<List<NearbyRestaurant>>();

  Observable<List<NearbyRestaurant>> get nearbyRestaurant =>
      _nearbyRestaurantFetcher.stream;

  fetchNearbyRestaurant() async {
    List<NearbyRestaurant> nearbyRestaurantResponse =
        await _repository.fetchNearbyRestaurant();
    _nearbyRestaurantFetcher.sink.add(nearbyRestaurantResponse);
  }

  dispose() {
    _nearbyRestaurantFetcher.close();
  }
}

final nearbyRestaurantBloc = NearbyRestaurantBloc();
