import 'package:flutter_clean_architecture/src/data/repositories/auth_repository.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/sign_in_use_case.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/signup_use_case.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpUseCase(Get.find<AuthRepositoryImpl>()));
    Get.lazyPut(() => SignInUseCase(Get.find<AuthRepositoryImpl>()));
    Get.lazyPut(() => AuthController(Get.find<SignUpUseCase>(), Get.find<SignInUseCase>()));
  }
}
