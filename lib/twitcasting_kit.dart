library twitcasting_kit;

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'src/api.dart';
part 'src/http_client.dart';
part 'src/live.dart';
part 'src/response.dart';

class Twitcasting {
  static Twitcasting _twitcasting;

  static void initialize(TwitcastingConfig config) {
    _createTwitcasting(config);
  }

  static void _createTwitcasting(TwitcastingConfig config) {
    if (_twitcasting != null) {}
    final client =
        _HttpClient.createGuestClient(config.clientId, config.clientSecret);
    _twitcasting = Twitcasting._(config, TwitcastingApiClient.create(client));
  }

  static Twitcasting getInstance() {
    if (_twitcasting == null) {}
    return _twitcasting;
  }

  final TwitcastingConfig _config;
  final TwitcastingApiClient _apiClient;

  Twitcasting._(this._config, this._apiClient);

  TwitcastingApiClient get apiClient => _apiClient;
}

class TwitcastingConfig {
  final String clientId;
  final String clientSecret;

  TwitcastingConfig(this.clientId, this.clientSecret);
}
