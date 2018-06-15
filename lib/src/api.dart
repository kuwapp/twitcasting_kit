part of twitcasting_kit;

const String _endPoint = "https://apiv2.twitcasting.tv";

class TwitcastingApiClient {
  final LiveService _liveService;

  TwitcastingApiClient._(this._liveService);

  factory TwitcastingApiClient.create(_HttpClient client) {
    final liveService = _LiveServiceImpl(client);
    return TwitcastingApiClient._(liveService);
  }

  LiveService get liveService => _liveService;
}

abstract class LiveService {
  Future<Live> getLive(String movieId);

  Future<List<Live>> getRecommendedLives();

  Future<List<Live>> getNewLives();
}

class _LiveServiceImpl implements LiveService {
  final _HttpClient client;

  _LiveServiceImpl(this.client);

  @override
  Future<Live> getLive(String movieId) async {
    final response = await client._get("$_endPoint/movies/$movieId");
    final body = json.decode(response.body);
    final movie = Movie.fromJson(body["movie"]);
    final user = User.fromJson(body["broadcaster"]);
    return Live(movie, user, []);
  }

  @override
  Future<List<Live>> getRecommendedLives() async {
    return _findLives("recommend");
  }

  @override
  Future<List<Live>> getNewLives() async {
    return _findLives("new");
  }

  Future<List<Live>> _findLives(String type) async {
    final response = await client
        ._get("$_endPoint/search/lives?limit=100&type=$type&lang=ja");
    final body = json.decode(response.body);
    return (body["movies"] as List<dynamic>).map<Live>((m) {
      final movie = Movie.fromJson(m["movie"]);
      final user = User.fromJson(m["broadcaster"]);
      final tags = (m["tags"] as List<dynamic>)
          .map<String>((t) => t.toString())
          .toList();
      return Live(movie, user, tags);
    }).toList();
  }
}
