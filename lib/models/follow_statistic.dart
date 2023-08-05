import 'dart:convert';

Follow followFromJson(String str) => Follow.fromJson(json.decode(str));

String followToJson(Follow data) => json.encode(data.toJson());

class Follow {
  int? followingCount;
  int? followersCount;
  List<FollowerElement>? following;
  List<FollowerElement>? followers;

  Follow({
    this.followingCount,
    this.followersCount,
    this.following,
    this.followers,
  });

  factory Follow.fromJson(Map<String, dynamic> json) => Follow(
        followingCount: json["following_count"],
        followersCount: json["followers_count"],
        following: json["following"] == null
            ? []
            : List<FollowerElement>.from(
                json["following"]!.map((e) => FollowerElement.fromJson(e))),
        followers: json["followers"] == null
            ? []
            : List<FollowerElement>.from(
                json["followers"]!.map((e) => FollowerElement.fromJson(e))),
      );

  Map<String, dynamic> toJson() => {
        "following_count": followingCount,
        "followers_count": followersCount,
        "following": following == null
            ? []
            : List<dynamic>.from(following!.map((e) => e.toJson())),
        "followers": followers == null
            ? []
            : List<dynamic>.from(followers!.map((e) => e.toJson())),
      };
}

class FollowerElement {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  int? isActive;
  dynamic country;
  dynamic ip;
  double? long;
  double? lat;
  List<Link>? links;

  FollowerElement({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.isActive,
    this.country,
    this.ip,
    this.long,
    this.lat,
    this.links,
  });

  factory FollowerElement.fromJson(Map<String, dynamic> json) =>
      FollowerElement(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        isActive: json["isActive"],
        country: json["country"],
        ip: json["ip"],
        long: json["long"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "isActive": isActive,
        "country": country,
        "ip": ip,
        "long": long,
        "lat": lat,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
      };
}

class Link {
  int? id;
  String? title;
  String? link;
  String? username;
  int? isActive;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Link({
    this.id,
    this.title,
    this.link,
    this.username,
    this.isActive,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        id: json["id"],
        title: json["title"],
        link: json["link"],
        username: json["username"],
        isActive: json["isActive"],
        userId: json["user_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "link": link,
        "username": username,
        "isActive": isActive,
        "user_id": userId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
