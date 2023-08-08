import 'package:flutter_clean_architecture/src/data/datasource/network/api_endpoint.dart';
import 'package:flutter_clean_architecture/src/data/datasource/network/api_provider.dart';
import 'package:flutter_clean_architecture/src/data/datasource/network/api_request_representable.dart';

enum AuthType { login, signup }

class AuthAPI extends APIRequestRepresentable {
  String? name;
  String? mobileNumber;
  String email;
  String password;
  AuthType type;

  AuthAPI._(
      {required this.email,
      required this.password,
      required this.type,
      this.name,
      this.mobileNumber});

  AuthAPI.login({required String email, required String password})
      : this._(email: email, password: password, type: AuthType.login);

  AuthAPI.signUp({required String name, required String mobileNumber, required String email, required String password})
      : this._(
            name: name,
            mobileNumber: mobileNumber,
            email: email,
            password: password,
            type: AuthType.signup);

  @override
  get body {
    switch (type) {
      case AuthType.login:
        return {'userId': email, 'password': password};
      case AuthType.signup:
        return {'name': name, 'mobileNumber': mobileNumber, 'userId': email, 'password': password};
    }
  }

  @override
  String get endpoint => APIEndpoint.newsApi;

  @override
  Map<String, String>? get headers => {"X-Api-Key": "d809d6a547734a67af23365ce5bc8c02"};

  @override
  HTTPMethod get method => HTTPMethod.post;

  @override
  String get path {
    switch (type) {
      case AuthType.login:
        return '/login';
      case AuthType.signup:
        return '/signup';
    }
  }

  @override
  Map<String, String>? get query => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
