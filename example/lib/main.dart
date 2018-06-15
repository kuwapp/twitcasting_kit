import 'package:flutter/material.dart';
import 'package:twitcasting_kit/twitcasting_kit.dart';

void main() {
  final clientId = "";
  final clientSecret = "";
  Twitcasting.initialize(TwitcastingConfig(clientId, clientSecret));
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _liveService = Twitcasting.getInstance().apiClient.liveService;
  List<Live> lives = [];

  @override
  void initState() {
    super.initState();
    _liveService.getRecommendedLives().then((lives) {
      setState(() => this.lives = lives);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Recommended List"),
        ),
        body: new ListView.builder(
          itemBuilder: (context, index) {
            final live = lives[index];
            return Container(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      width: 80.0,
                      height: 45.0,
                      image: NetworkImage(live.movie.smallThumbnailUrl),
                    ),
                    Flexible(
                      child: Text(
                        "${live.movie.title}",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ));
          },
          itemCount: lives.length,
        ));
  }
}
