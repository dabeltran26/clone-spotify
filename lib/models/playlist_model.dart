

class PlayList {
  PlayList({
    required this.playlists,
  });

  Playlists playlists;

  factory PlayList.fromJson(Map<String, dynamic> json) => PlayList(
    playlists: Playlists.fromJson(json["playlists"]),
  );

  Map<String, dynamic> toJson() => {
    "playlists": playlists.toJson(),
  };
}

class Playlists {
  Playlists({
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

  factory Playlists.fromJson(Map<String, dynamic> json) => Playlists(
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
    required this.collaborative,
    required this.description,
    required this.externalUrls,
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
  String href;
  String id;
  List<ImagePlayList> images;
  String name;
  Owner owner;
  dynamic primaryColor;
  dynamic public;
  String snapshotId;
  Tracks tracks;
  String type;
  String uri;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    collaborative: json["collaborative"],
    description: json["description"],
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    images: List<ImagePlayList>.from(json["images"].map((x) => ImagePlayList.fromJson(x))),
    name: json["name"],
    owner: Owner.fromJson(json["owner"]),
    primaryColor: json["primary_color"],
    public: json["public"],
    snapshotId: json["snapshot_id"],
    tracks: Tracks.fromJson(json["tracks"]),
    type: json["type"],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "collaborative": collaborative,
    "description": description,
    "external_urls": externalUrls.toJson(),
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

class ImagePlayList {
  ImagePlayList({
    required this.height,
    required this.url,
    required this.width,
  });

  dynamic height;
  String url;
  dynamic width;

  factory ImagePlayList.fromJson(Map<String, dynamic> json) => ImagePlayList(
    height: json["height"],
    url: json["url"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
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
  });

  String displayName;
  ExternalUrls externalUrls;
  String href;
  String id;
  String type;
  String uri;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    displayName: json["display_name"],
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    type: json["type"],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "display_name": displayName,
    "external_urls": externalUrls.toJson(),
    "href": href,
    "id": id,
    "type": type,
    "uri": uri,
  };
}

class Tracks {
  Tracks({
    required this.href,
    required this.total,
  });

  String href;
  int total;

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
    href: json["href"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
    "total": total,
  };
}
