import 'package:flutter_clean_architecture/src/app/core/usecases/param_usecase.dart';
import 'package:flutter_clean_architecture/src/domain/entities/paging.dart';
import 'package:flutter_clean_architecture/src/domain/repositories/article_repository.dart';
import 'package:tuple/tuple.dart';

class FetchNewsUseCase extends ParamUseCase<Paging, Tuple3<String, int, int>> {
  final ArticleRepository _repository;
  FetchNewsUseCase(this._repository);

  @override
  Future<Paging> execute(Tuple3<String, int, int> param) {
    return _repository.fetchNewByCategory(param.item1, param.item2, param.item3);
  }
}
