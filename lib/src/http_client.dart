part of twitcasting_kit;

class _HttpClient {
  final Map<String, String> _headers;

  _HttpClient._(this._headers);

  factory _HttpClient.createGuestClient(String clientId, String clientSecret) {
    final base64ClientIdSecret =
        base64.encode(utf8.encode("$clientId:$clientSecret"));
    final Map<String, String> headers = {
      "X-Api-Version": "2.0",
      "Authorization": "Basic $base64ClientIdSecret"
    };
    return _HttpClient._(headers);
  }

  Future<http.Response> _get(url, {Map<String, String> headers}) {
    return _execute(
        (client) => client.get(url, headers: headers ?? this._headers));
  }

  Future<http.Response> _post(url, {Map<String, String> headers, body}) {
    return _execute((client) =>
        client.post(url, body: body, headers: headers ?? this._headers));
  }

  Future<http.Response> _delete(url, {Map<String, String> headers}) {
    return _execute(
        (client) => client.delete(url, headers: headers ?? this._headers));
  }

  Future<http.Response> _put(url,
      {Map<String, String> headers, body, Encoding encoding}) {
    return _execute((client) =>
        client.put(url, headers: headers ?? this._headers, body: body));
  }

  Future<T> _execute<T>(Future<T> fn(http.Client client)) async {
    final client = http.Client();
    try {
      return await fn(client);
    } finally {
      client.close();
    }
  }
}
