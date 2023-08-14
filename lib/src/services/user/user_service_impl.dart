import 'package:burguer_app/src/models/user_model.dart';
import 'package:burguer_app/src/repositories/user/user_repository.dart';
import 'package:burguer_app/src/services/user/user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository userRepository;

  UserServiceImpl(this.userRepository);
  @override
  Future<UserModel> getById(int id) => userRepository.getById(id);
}
