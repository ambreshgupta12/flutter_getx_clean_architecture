import 'package:flutter_clean_architecture/src/app/services/local_storage.dart';
import 'package:flutter_clean_architecture/src/domain/entities/user.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/sign_in_use_case.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/signup_use_case.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class AuthController extends GetxController {
  final SignUpUseCase _signUpUseCase;
  final SignInUseCase _signInUseCase;
  AuthController(this._signUpUseCase, this._signInUseCase);

  final storage = Get.find<LocalStorage>();
  var isLoggedIn = false.obs;

  @override
  void onInit() {
    isLoggedIn.value = storage.user != null;
    super.onInit();
  }

  User? get user => storage.user;

  logout() {
    storage.user = null;
    isLoggedIn.value = false;
  }

  Future<void> signUp(
      {required String name,
      required String email,
      required String password,
      required String mobileNumber}) async {
    try {
      final params = Tuple4<String, String, String, String>(name, email,mobileNumber ,password);
      final user = await _signUpUseCase.execute(params);
      storage.user = user;
      isLoggedIn.value = true;
      isLoggedIn.refresh();
    } catch (error) {}
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      final params = Tuple2<String, String>(email, password);
      final user = await _signInUseCase.execute(params);
      storage.user = user;
      isLoggedIn.value = true;
      isLoggedIn.refresh();
    } catch (error) {}
  }
}
