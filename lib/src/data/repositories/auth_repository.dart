import 'package:flutter_clean_architecture/src/data/datasource/network/apis/auth_api.dart';
import 'package:flutter_clean_architecture/src/domain/entities/user.dart';
import 'package:flutter_clean_architecture/src/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<User> singIn({required String userId, required String password}) async {
    final response = await AuthAPI.login(email: userId, password: password).request();
    return User.fromJson(response);
  }

  @override
  Future<User> singUp({required String name, required String email, required String password, required String mobileNumber}) async {
   /*
    // todo working when api is working
    final response = await AuthAPI.signUp(
            name: name, mobileNumber: mobileNumber, password: password, email: email)
        .request();
        return User.fromJson(response);

        */
    await Future.delayed(const Duration(seconds: 1));
    return User(username: name, mobile: mobileNumber, email: email);

  }
}
