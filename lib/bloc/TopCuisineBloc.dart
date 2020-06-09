import 'package:rxdart/rxdart.dart';
import 'package:zomatodummyapp/Repository/Repository.dart';

class TopCuisineBloc {
  Repository _repository = Repository();

  final _topCuisineFetcher = PublishSubject<List<dynamic>>();

  Observable<List<dynamic>> get topCuisine => _topCuisineFetcher.stream;

  fetchNearbyTopCuisine() async {
    List<dynamic> topCuisineResponse = await _repository.fetchTopCuisines();
    _topCuisineFetcher.sink.add(topCuisineResponse);
  }

  dispose() {
    _topCuisineFetcher.close();
  }
}

final topCuisineBloc = TopCuisineBloc();
