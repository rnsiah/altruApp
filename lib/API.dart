// To parse this JSON data, do
//
//     final Shirt = ShirtFromJson(jsonString);

import 'dart:convert';
import 'package:altru/screens/Shirt_Selection.dart';
import 'package:altru/screens/Cause_List.dart';

List<Shirt> shirtsFromJson(String str) => List<Shirt>.from(json.decode(str).map((x) => Shirt.fromJson(x)));

String shirtsToJson(List<Shirt> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Shirt {
  Shirt({
    this.id,
    this.name,
    this.price,
    this.country,
    this.shirtImage,
    this.atrocity,
    this.slug,
    this.originalImage
  });

  int id;
  String name;
  double price;
  String country;
  String shirtImage;
  List<Atrocity> atrocity;
  String slug;
  String originalImage;

  factory Shirt.fromJson(Map<String, dynamic> json) => Shirt(
    id: json["id"],
    name: json["name"],
    originalImage: json['original_image'],
    price: json["price"].toDouble(),
    country: json["country"],
    shirtImage: json["shirt_image"],
    atrocity: List<Atrocity>.from(json["Atrocity"].map((x) => Atrocity.fromJson(x))),
    slug: json["slug"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "country": country,
    "shirt_image": shirtImage,
    "Atrocity": List<dynamic>.from(atrocity.map((x) => x.toJson())),
    "slug": slug,
    "original_image":originalImage,
  };
}

class Atrocity {
  Atrocity({
    this.title,
    this.region,
    this.info,
    this.imageUrl,
    this.category,
    this.country,
    this.slug,
    this.videoURL
  });

  String title;
  String region;
  String info;
  String imageUrl;
  List<Category> category;
  Country country;
  String slug;
  String videoURL;

  factory Atrocity.fromJson(Map<String, dynamic> json) => Atrocity(
    title: json["title"],
    region: json["region"],
    info: json["info"],
    imageUrl: json["image_url"],
    videoURL: json['videoURL'],
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    country: Country.fromJson(json["country"]),
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "region": region,
    "info": info,
    "image_url": imageUrl,
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
    "country": country.toJson(),
    "slug": slug,
    'videoURL':videoURL
  };
}

class Category {
  Category({
    this.name,
    this.image,
    this.information,
  });

  String name;
  String image;
  String information;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json["name"],
    image: json["image"],
    information: json["information"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "information": information,
  };
}

class Country {
  Country({
    this.id,
    this.name,
    this.flag,
  });

  int id;
  String name;
  String flag;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    name: json["name"],
    flag: json["flag"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "flag": flag,
  };
}



List<NonProfit> emptyFromJson(String str) => List<NonProfit>.from(json.decode(str).map((x) => NonProfit.fromJson(x)));

String NonProfitToJson(List<NonProfit> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NonProfit {
  NonProfit({
    this.name,
    this.logo,
    this.description,
    this.yearStarted,
    this.missionStatement,
    this.visionStatement,
    this.websiteUrl,
    this.category,
    this.slug,
    this.atrocity,
    this.shirtList,
    this.mainImage

  });

  String name;
  String logo;
  String description;
  int yearStarted;
  String missionStatement;
  String visionStatement;
  String websiteUrl;
  List<Category> category;
  String slug;
  List<Atrocity> atrocity;
  List<Shirt>shirtList;
  String mainImage;

  factory NonProfit.fromJson(Map<String, dynamic> json) => NonProfit(
    name: json["name"],
    logo: json["logo"],
    description: json["description"],
    yearStarted: json["year_started"],
    missionStatement: json["mission_statement"],
    visionStatement: json["vision_statement"],
    websiteUrl: json["website_url"],
    mainImage: json['main_image'],
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    slug: json["slug"],
    atrocity: List<Atrocity>.from(json["atrocity"].map((x) => Atrocity.fromJson(x))),
    shirtList: List<Shirt>.from(json["shirtList"].map((x) => Shirt.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "logo": logo,
    "description": description,
    "year_started": yearStarted,
    "mission_statement": missionStatement,
    "vision_statement": visionStatement,
    "website_url": websiteUrl,
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
    "slug": slug,
    "atrocity": List<dynamic>.from(atrocity.map((x) => x.toJson())),
    "shirtList": List<dynamic>.from(shirtList.map((x) => x.toJson())),
    "main_image":mainImage
  };
}




class PageLabel{
  String label;
  String route;
  String image;

  PageLabel({this.label, this.route, this.image});

}

final List<PageLabel> pageLabels=[
  PageLabel(label: 'New Shirts', route: ShirtSelection.id, image: ''),
  PageLabel(label: 'New Causes', route: Cause_List.id, image: '' ),
  PageLabel(label: 'Events', route: '', image: ''),
  PageLabel(label: 'Special Offers', route: '', image: ''),
];



final List<String>newShirts=[
  'images/Yemen V Neck.png',
  'images/Yemen V-Neck 3.png',
  'images/South America V-Neck.png',
  'images/Asia V-Neck.png',
  'images/Asia V-Neck 2.png',
  'images/Asia V-Neck 3.png',
  'images/African V-Neck 1.png',
  'images/Indonesia V-Neck.png'
];





User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.url,
    this.email,
    this.firstName,
    this.lastName,
    this.profile,
  });

  String url;
  String email;
  String firstName;
  String lastName;
  Profile profile;

  factory User.fromJson(Map<String, dynamic> json) => User(
    url: json["url"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    profile: Profile.fromJson(json["profile"]),
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "profile": profile.toJson(),
  };
}

class Profile {
  Profile({
    this.title,
    this.dob,
    this.address,
    this.country,
    this.city,
    this.zip,
    this.qrCode,
    this.shirtList,
    this.atrocityList,
    this.nonProfitList,
  });

  String title;
  DateTime dob;
  String address;
  String country;
  String city;
  String zip;
  String qrCode;
  List<Shirt> shirtList;
  List<Atrocity> atrocityList;
  List<NonProfit> nonProfitList;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    title: json["title"],
    dob: DateTime.parse(json["dob"]),
    address: json["address"],
    country: json["country"],
    city: json["city"],
    zip: json["zip"],
    qrCode: json["qr_code"],
    shirtList: List<Shirt>.from(json["shirt_list"].map((x) => Shirt.fromJson(x))),
    atrocityList: List<Atrocity>.from(json["atrocity_list"].map((x) => Atrocity.fromJson(x))),
    nonProfitList: List<dynamic>.from(json["nonProfit_list"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "address": address,
    "country": country,
    "city": city,
    "zip": zip,
    "qr_code": qrCode,
    "shirt_list": List<dynamic>.from(shirtList.map((x) => x.toJson())),
    "atrocity_list": List<dynamic>.from(atrocityList.map((x) => x.toJson())),
    "nonProfit_list": List<dynamic>.from(nonProfitList.map((x) => x)),
  };
}