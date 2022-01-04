

class Tracks {
  Tracks({
    required this.collaborative,
    required this.description,
    required this.externalUrls,
    required this.followers,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.owner,
    required this.primaryColor,
    required this.public,
    required this.snapshotId,
    required this.tracks,
    required this.type,
    required this.uri,
  });

  bool collaborative;
  String description;
  ExternalUrls externalUrls;
  Followers followers;
  String href;
  String id;
  List<Images> images;
  String name;
  Owner owner;
  String primaryColor;
  bool public;
  String snapshotId;
  TracksClass tracks;
  String type;
  String uri;

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
    collaborative: json["collaborative"],
    description: json["description"],
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    followers: Followers.fromJson(json["followers"]),
    href: json["href"],
    id: json["id"],
    images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
    name: json["name"],
    owner: Owner.fromJson(json["owner"]),
    primaryColor: json["primary_color"],
    public: json["public"],
    snapshotId: json["snapshot_id"],
    tracks: TracksClass.fromJson(json["tracks"]),
    type: json["type"],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "collaborative": collaborative,
    "description": description,
    "external_urls": externalUrls.toJson(),
    "followers": followers.toJson(),
    "href": href,
    "id": id,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "name": name,
    "owner": owner.toJson(),
    "primary_color": primaryColor,
    "public": public,
    "snapshot_id": snapshotId,
    "tracks": tracks.toJson(),
    "type": type,
    "uri": uri,
  };
}

class ExternalUrls {
  ExternalUrls({
    required this.spotify,
  });

  String spotify;

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
    spotify: json["spotify"],
  );

  Map<String, dynamic> toJson() => {
    "spotify": spotify,
  };
}

class Followers {
  Followers({
    required this.href,
    required this.total,
  });

  dynamic href;
  int total;

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
    href: json["href"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
    "total": total,
  };
}

class Images {
  Images({
    required this.height,
    required this.url,
    required this.width,
  });

  int height;
  String url;
  int width;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    height: json["height"] ?? 0,
    url: json["url"],
    width: json["width"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "height": height ,
    "url": url,
    "width": width,
  };
}

class Owner {
  Owner({
    required this.displayName,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.type,
    required this.uri,
    required this.name,
  });

  String displayName;
  ExternalUrls externalUrls;
  String href;
  String id;
  String type;
  String uri;
  String name;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    displayName: json["display_name"] ?? ' ',
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    type:json["type"],
    uri: json["uri"],
    name: json["name"]?? '' ,
  );

  Map<String, dynamic> toJson() => {
    "display_name": displayName == null ? null : displayName,
    "external_urls": externalUrls.toJson(),
    "href": href,
    "id": id,
    "type": type,
    "uri": uri,
    "name": name == null ? null : name,
  };
}

class TracksClass {
  TracksClass({
    required this.href,
    required this.items,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
  });

  String href;
  List<Item> items;
  int limit;
  dynamic next;
  int offset;
  dynamic previous;
  int total;

  factory TracksClass.fromJson(Map<String, dynamic> json) => TracksClass(
    href: json["href"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    limit: json["limit"],
    next: json["next"],
    offset: json["offset"],
    previous: json["previous"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "limit": limit,
    "next": next,
    "offset": offset,
    "previous": previous,
    "total": total,
  };
}

class Item {
  Item({
    required this.addedAt,
    required this.addedBy,
    required this.isLocal,
    required this.primaryColor,
    required this.track,
    required this.videoThumbnail,
  });

  DateTime addedAt;
  Owner addedBy;
  bool isLocal;
  dynamic primaryColor;
  Track track;
  VideoThumbnail videoThumbnail;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    addedAt: DateTime.parse(json["added_at"]),
    addedBy: Owner.fromJson(json["added_by"]),
    isLocal: json["is_local"],
    primaryColor: json["primary_color"],
    track: Track.fromJson(json["track"]),
    videoThumbnail: VideoThumbnail.fromJson(json["video_thumbnail"]),
  );

  Map<String, dynamic> toJson() => {
    "added_at": addedAt.toIso8601String(),
    "added_by": addedBy.toJson(),
    "is_local": isLocal,
    "primary_color": primaryColor,
    "track": track.toJson(),
    "video_thumbnail": videoThumbnail.toJson(),
  };
}

class Track {
  Track({
    required this.album,
    required this.artists,
    required this.availableMarkets,
    required this.discNumber,
    required this.durationMs,
    required this.episode,
    required this.explicit,
    required this.externalIds,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.isLocal,
    required this.name,
    required this.popularity,
    required this.previewUrl,
    required this.track,
    required this.trackNumber,
    required this.type,
    required this.uri,
  });

  Album album;
  List<Owner> artists;
  List<String> availableMarkets;
  int discNumber;
  int durationMs;
  bool episode;
  bool explicit;
  ExternalIds externalIds;
  ExternalUrls externalUrls;
  String href;
  String id;
  bool isLocal;
  String name;
  int popularity;
  String previewUrl;
  bool track;
  int trackNumber;
  String type;
  String uri;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
    album: Album.fromJson(json["album"]),
    artists: List<Owner>.from(json["artists"].map((x) => Owner.fromJson(x))),
    availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
    discNumber: json["disc_number"],
    durationMs: json["duration_ms"],
    episode: json["episode"],
    explicit: json["explicit"],
    externalIds: ExternalIds.fromJson(json["external_ids"]),
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    isLocal: json["is_local"],
    name: json["name"],
    popularity: json["popularity"],
    previewUrl: json["preview_url"] ?? '',
    track: json["track"],
    trackNumber: json["track_number"],
    type: json["type"],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "album": album.toJson(),
    "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
    "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
    "disc_number": discNumber,
    "duration_ms": durationMs,
    "episode": episode,
    "explicit": explicit,
    "external_ids": externalIds.toJson(),
    "external_urls": externalUrls.toJson(),
    "href": href,
    "id": id,
    "is_local": isLocal,
    "name": name,
    "popularity": popularity,
    "preview_url": previewUrl == null ? null : previewUrl,
    "track": track,
    "track_number": trackNumber,
    "type":type,
    "uri": uri,
  };
}

class Album {
  Album({
    required this.albumType,
    required this.artists,
    required this.availableMarkets,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.totalTracks,
    required this.type,
    required this.uri,
  });

  String albumType;
  List<Owner> artists;
  List<String> availableMarkets;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<Images> images;
  String name;
  String releaseDate;
  String releaseDatePrecision;
  int totalTracks;
  String type;
  String uri;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
    albumType:json["album_type"],
    artists: List<Owner>.from(json["artists"].map((x) => Owner.fromJson(x))),
    availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
    name: json["name"],
    releaseDate: json["release_date"],
    releaseDatePrecision:json["release_date_precision"],
    totalTracks: json["total_tracks"],
    type: json["type"],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "album_type": albumType,
    "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
    "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
    "external_urls": externalUrls.toJson(),
    "href": href,
    "id": id,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "name": name,
    "release_date": releaseDate,
    "release_date_precision": releaseDatePrecision,
    "total_tracks": totalTracks,
    "type": type,
    "uri": uri,
  };
}

class ExternalIds {
  ExternalIds({
    required this.isrc,
  });

  String isrc;

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
    isrc: json["isrc"],
  );

  Map<String, dynamic> toJson() => {
    "isrc": isrc,
  };
}

class VideoThumbnail {
  VideoThumbnail({
    required this.url,
  });

  dynamic url;

  factory VideoThumbnail.fromJson(Map<String, dynamic> json) => VideoThumbnail(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}
