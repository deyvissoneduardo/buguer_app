import '../../models/user_model.dart';

abstract class UserService {
  Future<UserModel> getById(int id);
}
