part of twitcasting_kit;

class Movie {
  final String id;
  final String userId;
  final String title;
  final String subTitle;
  final String lastOwnerComment;
  final String category;
  final String link;
  final bool isLive;
  final bool isRecorded;
  final int commentCount;
  final String largeThumbnailUrl;
  final String smallThumbnailUrl;
  final String country;
  final int duration;
  final int created;
  final bool isCollabo;
  final bool isProtected;
  final int maxViewerCount;
  final int currentViewerCount;
  final int totalViewerCount;
  final String hlsUrl;

  Movie(
      {@required this.id,
      @required this.userId,
      @required this.title,
      @required this.subTitle,
      @required this.lastOwnerComment,
      @required this.category,
      @required this.link,
      @required this.isLive,
      @required this.isRecorded,
      @required this.commentCount,
      @required this.largeThumbnailUrl,
      @required this.smallThumbnailUrl,
      @required this.country,
      @required this.duration,
      @required this.created,
      @required this.isCollabo,
      @required this.isProtected,
      @required this.maxViewerCount,
      @required this.currentViewerCount,
      @required this.totalViewerCount,
      @required this.hlsUrl});

  factory Movie.fromJson(json) {
    return Movie(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        subTitle: json["subtitle"],
        lastOwnerComment: json["last_owner_comment"],
        category: json["category"],
        link: json["link"],
        isLive: json["is_live"],
        isRecorded: json["is_recorded"],
        commentCount: json["comment_count"],
        largeThumbnailUrl: json["large_thumbnail"],
        smallThumbnailUrl: json["small_thumbnail"],
        country: json["country"],
        duration: json["duration"],
        created: json["created"],
        isCollabo: json["is_collabo"],
        isProtected: json["is_protected"],
        maxViewerCount: json["max_view_count"],
        currentViewerCount: json["current_view_count"],
        totalViewerCount: json["total_view_count"],
        hlsUrl: json["hls_url"]);
  }
}

class User {
  final String id;
  final String screenId;
  final String name;
  final String thumbnailUrl;
  final String profileMessage;
  final int level;
  final String lastMovieId;
  final bool isLive;
  final int supporterCount;
  final int supportingCount;
  final int created;

  User(
      {@required this.id,
      @required this.screenId,
      @required this.name,
      @required this.thumbnailUrl,
      @required this.profileMessage,
      @required this.level,
      @required this.lastMovieId,
      @required this.isLive,
      @required this.supporterCount,
      @required this.supportingCount,
      @required this.created});

  factory User.fromJson(json) {
    return User(
        id: json["id"],
        screenId: json["screen_id"],
        name: json["name"],
        thumbnailUrl: json["image"],
        profileMessage: json["profile"],
        level: json["level"],
        lastMovieId: json["last_movie_id"],
        isLive: json["is_live"],
        supporterCount: json["supporter_count"],
        supportingCount: json["supporting_count"],
        created: json["created"]);
  }
}
