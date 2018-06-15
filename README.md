# twitcasting_kit


A Flutter package to call Twitcasting api.

[Twitcasting API V2 Document](http://apiv2-doc.twitcasting.tv/)

## Initialize Twitcasting

```dart
Twitcasting.initialize(TwitcastingConfig(clientId, clientSecret));
```

## Usage

```dart
final liveService = Twitcasting.getInstance().apiClient.liveService;
    
liveService.getRecommendedLives().then((lives) {
  // TODO
});

liveService.getLive(movieId).then((live) {
  // TODO
});

liveService.getNewLives().then((lives) {
  // TODO
});
```
