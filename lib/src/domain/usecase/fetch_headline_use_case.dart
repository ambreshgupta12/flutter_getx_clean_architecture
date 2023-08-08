import 'package:flutter_clean_architecture/src/app/core/usecases/param_usecase.dart';
import 'package:flutter_clean_architecture/src/domain/entities/paging.dart';
import 'package:flutter_clean_architecture/src/domain/repositories/article_repository.dart';
import 'package:tuple/tuple.dart';

class FetchHeadlineUseCase extends ParamUseCase<Paging, Tuple2<int, int>> {
  FetchHeadlineUseCase(this._repository);

  final ArticleRepository _repository;
  @override
  Future<Paging> execute(Tuple2<int, int> param) {
    return _repository.fetchHeadLine(param.item1, param.item2);
  }
}
