// Convert json to class
// https://app.quicktype.io/
// String _str = "{\"id\":\"d2as-a6d8-as7d-76s87ad\",\"name\":\"LuizGuerra\",\"email\":\"email@email.com\",\"passwordHash\":\"ads7-a6d8-as7d-76s87ad\",\"salt\":\"salt\"}";

class User {
    User({
        required this.id,
        required this.name,
        required this.email,
        required this.passwordHash
    });

    String id;
    String name;
    String email;
    String passwordHash;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        passwordHash: json["passwordHash"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "passwordHash": passwordHash
    };
}
