import 'package:rxdart/rxdart.dart';
import 'package:zomatodummyapp/Repository/Repository.dart';
import 'package:zomatodummyapp/model/IndividualRestaurantDetails.dart';

class IndividualRestaurantDetailBloc {
  Repository _repository = Repository();

  final _individualRestaurantFetcher =
      PublishSubject<IndividualRestaurantDetail>();

  Observable<IndividualRestaurantDetail> get individualRestDetails =>
      _individualRestaurantFetcher.stream;

  fetchIndividualRestDetail(String resID) async {
    IndividualRestaurantDetail individualRestaurantDetailResponse =
        await _repository.fetchIndividualRestaurantDetail(resID);
    _individualRestaurantFetcher.sink.add(individualRestaurantDetailResponse);
  }

  dispose() {
    _individualRestaurantFetcher.close();
  }
}

final individualRestaurantDetailBloc = IndividualRestaurantDetailBloc();
