import 'dart:convert';


class ListeUser{
  final List<User> listes;

  ListeUser({this.listes});

  factory ListeUser.fromJson(List<Map<String, dynamic>>json){
    List<User> list = new List<User>();
    list = json.map((f)=> User.fromJson(f)).toList();
    return ListeUser(
      listes: list
    );
  }

}


class User{
  bool is_superuser;
  String username;
  String email;

  User({this.is_superuser, this.username, this.email});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
        is_superuser: json["is_superuser"],
        username: json["username"],
        email: json["email"]
    );
  }
}

