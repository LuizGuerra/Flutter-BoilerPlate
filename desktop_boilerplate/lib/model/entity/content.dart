import 'dart:convert';

class Content {
  Content({
    required this.title,
    required this.description,
    required this.numbers,
    required this.image,
    required this.id,
  });

  final String title;
  final String description;
  final List<int> numbers;
  final String image;
  final String id;

  factory Content.fromRawJson(String str) => Content.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        title: json["title"],
        description: json["description"],
        numbers: List<int>.from(json["numbers"].map((x) => x)),
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "numbers": List<dynamic>.from(numbers.map((x) => x)),
        "image": image,
        "id": id,
      };
}
