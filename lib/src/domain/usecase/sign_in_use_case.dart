import 'package:flutter_clean_architecture/src/app/core/usecases/param_usecase.dart';
import 'package:flutter_clean_architecture/src/domain/entities/user.dart';
import 'package:flutter_clean_architecture/src/domain/repositories/auth_repository.dart';
import 'package:tuple/tuple.dart';

class SignInUseCase extends ParamUseCase<User, Tuple2<String, String>> {
  final AuthRepository _repository;
  SignInUseCase(this._repository);

  @override
  Future<User> execute(Tuple2<String, String> param) {
    return _repository.singIn(userId: param.item1, password: param.item2);
  }
}