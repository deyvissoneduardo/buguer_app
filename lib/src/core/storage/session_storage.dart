import 'package:burguer_app/src/core/storage/storege.dart';

class SessionStorage extends Storage {
  @override
  void clean() {}

  @override
  String getData(String key) {
    throw UnimplementedError();
  }

  @override
  void setData(String key, String value) {}
}
