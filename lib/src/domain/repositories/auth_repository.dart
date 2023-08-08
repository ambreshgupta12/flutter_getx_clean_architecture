import 'package:flutter_clean_architecture/src/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> singIn({required String userId, required String password});

  Future<User> singUp(
      {required String name, required String email, required String mobileNumber, required String password,});
}
