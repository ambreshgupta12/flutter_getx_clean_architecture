enum HTTPMethod { get, post, delete, put, patch }

extension HTTPMethodString on HTTPMethod {
  String get string {
    switch (this) {
      case HTTPMethod.get:
        return 'get';
      case HTTPMethod.post:
        return 'post';
      case HTTPMethod.delete:
        return 'delete';
      case HTTPMethod.put:
        return 'put';
      case HTTPMethod.patch:
        return 'patch';
    }
  }
}


abstract class APIRequestRepresentable{
  String get url;
  String get endpoint;
  String get path;
  HTTPMethod get method;
  Map<String,String>? get headers;
  Map<String,String>? get query;
  dynamic get body;
  Future request();
}