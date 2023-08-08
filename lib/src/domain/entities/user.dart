class User {
  User({this.username, this.email, this.mobile});

  String? username;
  String? email;
  String? mobile;

  factory User.fromJson(Map<String, dynamic>? json) {
    return User(
        username: json?['username'] as String?,
        email: json?['email'] as String?,
        mobile: json?['mobile'] as String?);
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'mobile': mobile,
      };
}
