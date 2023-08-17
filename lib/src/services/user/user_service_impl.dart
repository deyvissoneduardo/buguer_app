import '../../models/user_model.dart';
import '../../repositories/user/user_repository.dart';
import 'user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository userRepository;

  UserServiceImpl(this.userRepository);
  @override
  Future<UserModel> getById(int id) => userRepository.getById(id);
}
