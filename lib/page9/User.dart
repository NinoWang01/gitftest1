class User{
  final String name;
  final String email;

  User(this.name, this.email);


  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  ///json.encode已经做了这个操作，所以用不到
  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'email': email,
      };
}