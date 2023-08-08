import 'package:flutter_clean_architecture/src/app/core/usecases/param_usecase.dart';
import 'package:flutter_clean_architecture/src/domain/entities/user.dart';
import 'package:flutter_clean_architecture/src/domain/repositories/auth_repository.dart';
import 'package:tuple/tuple.dart';

class SignUpUseCase extends ParamUseCase<User, Tuple4<String, String, String, String>> {
  final AuthRepository _repository;
  SignUpUseCase(this._repository);

  @override
  Future<User> execute(Tuple4<String, String, String, String> param) {
    return _repository.singUp(
        name: param.item1, email: param.item2, mobileNumber: param.item3, password: param.item4);
  }
}
