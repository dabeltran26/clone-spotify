
class Categories {
  Categories({
    required this.categories,
  });

  CategoriesClass categories;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    categories: CategoriesClass.fromJson(json["categories"]),
  );

  Map<String, dynamic> toJson() => {
    "categories": categories.toJson(),
  };
}

class CategoriesClass {
  CategoriesClass({
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
  String next;
  int offset;
  dynamic previous;
  int total;

  factory CategoriesClass.fromJson(Map<String, dynamic> json) => CategoriesClass(
    href: json["href"] ?? '' ,
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    limit: json["limit"] ?? 0,
    next: json["next"] ?? '',
    offset: json["offset"] ?? 0,
    previous: json["previous"] ?? '',
    total: json["total"] ?? 0,
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
    required this.href,
    required this.icons,
    required this.id,
    required this.name,
  });

  String href;
  List<Icon> icons;
  String id;
  String name;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    href: json["href"] ?? '',
    icons: List<Icon>.from(json["icons"].map((x) => Icon.fromJson(x))),
    id: json["id"] ?? '',
    name: json["name"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "href": href,
    "icons": List<dynamic>.from(icons.map((x) => x.toJson())),
    "id": id,
    "name": name,
  };
}

class Icon {
  Icon({
    required this.height,
    required this.url,
    required this.width,
  });

  int height;
  String url;
  int width;

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
    height: json["height"] ?? 0,
    url: json["url"],
    width: json["width"]  ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "height": height == null ? null : height,
    "url": url,
    "width": width == null ? null : width,
  };
}
